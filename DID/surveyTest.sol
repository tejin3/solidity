

pragma solidity 0.8.9;

contract survey {
    
    address owner;
    //  
    
    
    mapping (uint => mapping(address => bool)) public surveyUser;
    mapping (uint => address[]) public surveyCompleteList;
    mapping (uint => uint) public surveyCount;
    event addUser(uint, address);

    constructor () {
        owner = msg.sender;
    }
    
   
    //
    function recordSurvey (uint _num)public {
     require(surveyUser[_num][tx.origin] == false);
      
        surveyUser[_num][tx.origin] = true;
        surveyCompleteList[_num].push(tx.origin);
        surveyCount[_num]++;
        emit addUser(_num , tx.origin);
        // 디비저장
        
    }
}
