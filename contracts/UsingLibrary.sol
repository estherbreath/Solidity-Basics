// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
//import our library
import "./ErrorCheckLibrary.sol";

contract UsingLibrary{
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        //set the transaction sender as the owner of the contract
        owner = msg.sender;
    }

    function changeOwner(address _newOwner) public returns(bool) {
        //make reference to to the imported function
        bool isZeroAddress = ErrorChecker.checkZeroAddress(_newOwner);
        owner = _newOwner;
        return isZeroAddress;
    }
}