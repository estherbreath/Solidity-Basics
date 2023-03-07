// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract Errors{
    address[] public users;

    function addUser(address _addr) external {
        // require(_addr != address(0), "WE DONT ACCEPT ZERO ADDRESS");
        // if(_addr == address(0)) {
        //     revert("ZERO ADDRESS, NO");
        // }
        assert(_addr != address(0));
        users.push(_addr);
    }
}