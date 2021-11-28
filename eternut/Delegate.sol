
pragma solidity ^0.6.0;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(0xc72Dee2435a8Ae8f0299F3a3ab184e8145c0dA6b).delegatecall(abi.encodeWithSignature("pwn()"));
    if (result) {
      this;
    }
  }
}
