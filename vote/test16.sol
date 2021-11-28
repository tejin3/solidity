
pragma solidity 0.8.6;

contract counter {

    uint one;
    uint two;
    uint three;
    uint four;

  mapping (address => uint) public voteCheck;
   mapping (uint => address) public buyList;

    uint public ourMoney;
    address public owner;
    
  
    event buyAddress(address seller);

    uint startTime;

  constructor (address _one, address _two, address _three, address _four)payable{
      owner = tx.origin;
      startTime = block.timestamp;
      ourMoney += msg.value;
      buyList[1] = _one;
     buyList[2] = _two;
     buyList[3] = _three;
     buyList[4] = _four;
  }

function setAddress() private view returns(address) {
              if(one>two){
	if(three>four){
		if(one>three){
			return buyList[1];
		}else{
			return buyList[3];
		}
	}else{
		if(one>four){
			return buyList[1];
		}else{		
			return buyList[4];
		}
	}
}else{
	if(three>four){
		if(two>three){		
			return buyList[2];
		}else{		
			return buyList[3];
		}
	}else{
		if(two>four){		
			return buyList[2];
		}else{
			return buyList[4];
		}
	}
}
          }

//  private
 function sendMoney()  public{
      require(block.timestamp >= startTime + 5 minutes);
      emit buyAddress(setAddress());
      selfdestruct(payable(setAddress()));
    }

  function vote(uint _num) public {
      require(voteCheck[tx.origin] == 0);
 
      voteCheck[tx.origin]++;
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

  function getMyVote() public view returns(uint){
      return voteCheck[tx.origin];
  }

//  function setResult() private{
     
// }


}

