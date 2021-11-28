
pragma solidity 0.8.6;

contract counter {

    uint one;
    uint two;
    uint three;
    uint four;

  mapping (address => uint) voteCheck;
  mapping (address => uint) public yourMoney;
  mapping (uint => address) public buyList;

    uint public ourMoney;
    address public owner;
    
    address public result;
    event SetAddress(address seller);

    uint startTime;

  constructor (){
      owner = tx.origin;
      startTime = block.timestamp;
  }
  
//   require(block.timestamp >= startTime + 5 hours)
//  now 
 
 function setBuyList(address _one, address _two, address _three, address _four) public{
     require(msg.sender == owner);
     buyList[1] = _one;
     buyList[2] = _two;
     buyList[3] = _three;
     buyList[4] = _four;
 }
 
// 투표하면서 바로
 
function money() payable public {
    require(msg.value == 1 ether);
    yourMoney[tx.origin] += msg.value;
    ourMoney += msg.value;
}

function setAddress(address _result) public {
              result = _result;
              emit SetAddress(_result);
          }

//  private
 function buyIt() public {
      selfdestruct(payable(result));
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
