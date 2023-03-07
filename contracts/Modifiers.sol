// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract Modifiers{
    //these are variables to be used
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        //set the transaction owner as the owner
    owner = msg.sender;
    }
    modifier onlyOwner{
        require(msg.sender == owner, "not owner");
        _;

    }

        modifier AddressCheck(address _addr) {
            require(_addr != address (0), "ADDESS IS ADDRESS 0");
            _;
        }

        function changeOwner(address _newOwner) public onlyOwner AddressCheck(_newOwner) {
            owner = _newOwner;
        }
        
    
}