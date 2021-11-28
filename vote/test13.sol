


pragma solidity 0.8.6;

contract counter {

    uint one;
    uint two;
    uint three;
    uint four;

  mapping (address => uint) check;
  mapping (address => uint) public yourMoney;

    uint public ourMoney;
    address public owner;

  constructor (){
      owner = tx.origin;
  }

function money(uint money1) payable public {
    payable(tx.origin).transfer(money1);
    yourMoney[tx.origin] += money1;
    ourMoney += money1;
}

  function increment1(uint _num) public {
      require(check[tx.origin] == 0);
      check[tx.origin]++;
    //   Vote memory v = Vote(0,1,0,0);

      if(1 == _num){
           one++; 
      }else if(2 == _num){
           two++;
      }else if(3 == _num){
           three++;
      }else if(4 == _num){
           four++;
      }
  }
  function seeResult() public view returns(uint, uint, uint, uint) {
      return (one, two, three, four);
  }

  function getCount() public view returns(uint){
      return check[tx.origin];
  }

 function setResult() private{

}

 function withdraw(address result, uint _num1) private {
      payable(result).transfer(_num1);
    }

}
