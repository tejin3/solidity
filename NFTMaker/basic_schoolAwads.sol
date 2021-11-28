
pragma solidity 0.8.7;

import "./safemath.sol";

contract schoolAwads {
    
    using SafeMath for uint256;
    
    address public owner;
    address public awadsMaker1;
    address public awadsMaker2;
    
    uint public rightNow;
    uint public schoolAwadsId = 0;
    uint public checkTime;
    uint public openTime;
    uint public check = 0;
    uint public check1 = 1;
    
    string public schoolAwadsName;
    
    mapping (uint => address) public schoolAwadsIdToOwner;
    mapping(uint => address) public changerApprovals;
    
    constructor(uint _openTime, address _awadsMaker1, address _awadsMaker2, string memory _schoolAwadsName) {
        owner = msg.sender;
        checkTime = 330 days;
        openTime = _openTime;
        awadsMaker1 = _awadsMaker1;
        awadsMaker2 = _awadsMaker2;
        schoolAwadsName = _schoolAwadsName;
    }

    function start () public  {
        require(owner == msg.sender || awadsMaker1 == msg.sender || awadsMaker2 == msg.sender);
        require(openTime <= (block.timestamp - rightNow));
        require(checkTime < block.timestamp - rightNow);
        rightNow = block.timestamp;
    } 
 
    function createAwads (address _student) public {
        require(owner == msg.sender || awadsMaker1 == msg.sender || awadsMaker2 == msg.sender);
        if(schoolAwadsId == 0){
            schoolAwadsId = schoolAwadsId.add(1);
            schoolAwadsIdToOwner[schoolAwadsId] = _student;
            rightNow = block.timestamp;
        } else if (openTime > (block.timestamp - rightNow)) {
            schoolAwadsId = schoolAwadsId.add(1);
            schoolAwadsIdToOwner[schoolAwadsId] = _student;
        } 
    }
    
    function change (address _to) public {
        if(owner == msg.sender){
            changerApprovals[0] = _to;
        } else if( awadsMaker1 == msg.sender ){
            changerApprovals[1] = _to;
        } else if( awadsMaker2 == msg.sender) {
            changerApprovals[2] = _to;
        }
    }
    function changeMaker () public {
        if(changerApprovals[0] == msg.sender){
            owner = msg.sender;
        } else if(changerApprovals[1] == msg.sender){
            awadsMaker1 = msg.sender;
        } else if(changerApprovals[2] == msg.sender){
            awadsMaker2 = msg.sender;
        }    
    }
    
}