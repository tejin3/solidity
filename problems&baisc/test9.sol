

pragma solidity 0.8.6;

contract counter {
    uint count;
    
    constructor(uint _count){
      count = _count;
  }
  function increment() public {
      count++;
  }
  function getCount() public view returns(uint){
      return count;
  }
  
  
}
