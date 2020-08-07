// contracts/Box.sol
// SPDx-License-Identifier:MIT
pragma solidity ^0.6.0;

import "./Auth.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Box is Ownable{
    uint256 private value;

    Auth private auth;

    // Emitted when the stored value changes
    event ValueChanged(uint256 newValue);

    constructor(Auth _auth) public {
        auth = _auth;
    }

    // Stores a new value in the contract
    function store(uint256 newValue) public onlyOwner {
        require(auth.isAdministrator(msg.sender), "Unauthorized");
        value = newValue;
        emit ValueChanged(newValue);
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }
}
