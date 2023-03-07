// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ConstructorA{
    uint totalSupply;
    constructor(uint _totalSupply) {
        totalSupply = _totalSupply;
    }
    //adding virtual allows us inherit the function from parent
    function getTotalSupply() public view virtual returns(uint) {
        return totalSupply;
    }
    //if the child contract has no constructor

    // contract ConstructorB is ConstructorA(1000) {

    // }
    //if the second contract has a constructor

    contract ConstructorB is ConstructorA{
        uint acctSupply;
        constructor(uint _acctSupply) ConstructorA(1000) {
            acctSupply = _acctSupply;
        }
        //to change the function and override the inherited function
        function getTotalSupply() public view override returns(uint) {
            //the Super keyword references the parent contractand its a way of callig strings in the parent
            uint parentSupply = super.getTotalSupply();
            return acctSupply+ parentSupply;
        }
    }

}

