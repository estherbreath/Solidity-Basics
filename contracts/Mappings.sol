// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract Mappings{
     mapping(uint => string)students;
     mapping(address => uint) public balances;

    //Testing out delete value pairs

    mapping(uint => address) public idToUser;
    mapping(address => uint) public userToId;
    uint id = 0;

     function addStudent(uint _id, string memory _name) public{
         students[_id] = _name;
     }
     function updateBalance(uint _amount) public returns(address){
         balances[msg.sender] += _amount;
         return msg.sender;
     }

     function viewStudent(uint _id) public view returns(string memory){
         string memory studentName = students[_id];
         return studentName;
     }
     function addAddress(address _addr) public{
         id++;
         idToUser[id] = _addr;
         userToId[_addr] = id;
     }
     function removeAddress(uint _id) public{
         //save the address stored to the id
         address  temp = idToUser[_id];
         //remove the address tied to the id
         idToUser[_id] = address(0);
         //removal of id
         userToId[temp] = 0;
     }
}