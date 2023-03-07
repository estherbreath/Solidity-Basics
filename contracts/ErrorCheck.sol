// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

library ErrorCheck{
    function checkZeroAddress(address _addr) external pure returns(bool) {
        if(_addr == address(0)) {
            return true;
        }
        return false;
    }
}