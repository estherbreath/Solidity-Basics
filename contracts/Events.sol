// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract Events{
    //define an event
    //indexed arguements are easier to access
    event withdrawal(address indexed receiver, uint indexed amount);

    function withDrawFunds() public {
        //the withdraw logic
        (bool success, ) = payable(msg.sender).call{value: 0}("");
        //emit the event
        emit withdrawal(msg.sender, 0);
    }
}