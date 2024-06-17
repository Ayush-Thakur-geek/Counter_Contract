// SPDX-License-Identifier: MIT

// Smart Contract Project
// For this project, write a smart contract that implements the require(), assert() and revert() statements.

// Upload your solution to GitHub and share the link with us along with a quick code walk-through as explained below.

pragma solidity ^0.8.24;

contract Counter {
    uint256 public counter;
    address public owner;

    modifier isOwner() {
        require(msg.sender == owner, "Caller isn't the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function incrementCounter(uint256 value) public {
        require(value > 0, "Value must be greater than zero.");
        counter += value;
    }

    function checkCounter() private view {
        assert(counter >= 0);
    }

    function resetCounter() public isOwner {
        counter = 0;
    }

    function setCounter(uint256 newValue) public isOwner {
        if (newValue >= 0) {
            counter = newValue;
            checkCounter();
        } else {
            revert("The value should be greater than zero.");
        }
    }
}
