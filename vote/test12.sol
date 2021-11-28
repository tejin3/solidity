
pragma solidity 0.8.6;

contract counter {
    
    uint one1;
    uint two1;
    uint three1;
    uint four1;
  
  
  mapping (address => uint) check;

    address owner;

  constructor (){
      owner = tx.origin;
  }
    
  function increment1(uint _num) public {
      require(check[tx.origin] == 0);
      check[tx.origin]++;
      
    //   Vote memory v = Vote(0,1,0,0);
      
      if(1 == _num){
           one1++; 
      }else if(2 == _num){
           two1++;
      }else if(3 == _num){
           three1++;
      }else if(4 == _num){
           four1++;
      }
  }
  function seeResult() public view returns(uint, uint, uint, uint) {
      return (one1, two1, three1, four1);
      
  }
  
  function getCount() public view returns(uint){
      return check[tx.origin];
  }
  
  
}