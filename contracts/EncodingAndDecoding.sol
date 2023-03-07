// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract EncodingAndDecoding{

    function encode(string memory _info) public pure returns(bytes memory) {
        return abi.encode(_info);
    }

    function decode(bytes memory _encd) public pure returns(string memory) {
        return abi.decode(_encd, (string));
    }
}