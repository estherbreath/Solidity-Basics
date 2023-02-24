// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract Array{
    uint[] public ids;
    address[] users;
    uint[10] public fixedId = [9,34, 4, 56, 65, 70, 12, 9, 32, 10];
    uint[] public defaultVal = [1, 2, 3];

    function addUsers(address _addr) public{
        users.push(_addr);
    }
    function removeLastUser() public{
        users.pop();
    }
    function getArrLength() public view returns(uint){
        return users.Length;
    }
    function getAllUsers() public view returns(address[] memory){
        return users;
    }
    function removeUser(address _addr) public {
        //get the index of the address
        uint index = getUserIndex(_addr);
        //use delete keyword to delete
        delete users[index];
    }
    function removePermanently(address _addr) public {
        //get the index
        uint index = getUserIndex(_addr);
        //store last user temporarily
        address temp = [users.length - 1];
        //swap to be deleted with last user
        users[users.lenth -1] = users[index];
        //swap last user with the position of the deleted
        users[index] = temp;
        removeLastUser();
    }
    function getUserIndex(address _addr) private view returns(uint){
        for(uint i=0; i<users[1]; i++){
            if (users[i] == _addr){
                return i;
            }
        }
        return 0;
    }
}