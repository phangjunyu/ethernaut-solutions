// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) public {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}

/*
solution:
call web3.eth.getStorageAt("contract address", 1)

call web3.utils.hexToAscii("the bytes32 result from above") if you want to view the password in readable format
*/
