// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract IdGenerator{
    uint public id = 0;

    function increment() external {
        id +=1;
    }
}

interface IIdGenerator{
    //since state variables automatically comes with a getter function, we can create a view function for it in the interface

    function id() external view returns(uint);  

    function increment() external;
}
contract Interfaces{
    //address of the contract are interfacing
    address IIdGen;
    constructor(address _IIdgen) {
        IIdGen = _IIdgen;
    }

    function getCurrentId() external view returns(uint) {
        uint currentId = IIdGenerator(IIdGen).id();
        return currentId;
    }
}