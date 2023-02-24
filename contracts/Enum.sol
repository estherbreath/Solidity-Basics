// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract Enum{
    //enum represents user defined states
    enum Status{
        Unapproved,
        Pending,
        Approved
    }
    Status public loanState;
    //mapping an address to an enum
    mapping(address => Status) public userState;
    //mapping for address to amount paid
    mapping(address => uint) public userBalance;
    function get() public view returns(Status){
        return loanState;
    }
    function makePending() public {
        loanState = Status.Pending;
    }
     function makeApproved() public {
        loanState = Status.Approved;
    }
    function applyLoan() payable public{
        userBalance[msg.sender] = msg.value;
        userState[msg.sender] = Status.Pending;
    }
    function payout() public returns(bool){
        uint amount = (userBalance[msg.sender])/2;
        //change state
        userBalance[msg.sender] = 0;
        userState[msg.sender] = Status.Approved;
        address _to = payable(msg.sender);
        //function that will allow contract to pay user
        (bool sent,) = _to.call{value: amount}("");
        return sent;
    }
}