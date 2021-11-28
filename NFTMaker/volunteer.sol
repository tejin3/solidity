
pragma solidity 0.8.7;

import "./safemath.sol";

contract volunteer {
    
    using SafeMath for uint256;
    
    address public owner;
    
    uint public volunteerNFTId = 0;
    mapping (uint => address) public volunteerToOwner;
    mapping (uint => uint) public volunteerToHour;
    mapping (uint => string) public volunteerToWhat;
    
    mapping (uint => address) public newMaker;
    
    
    mapping (uint => bool) public nftToVote;
    uint public noCount;
    address public yetNewMaker;
    
    uint public newMakerNum;
    uint public time;
    
    constructor () {
        owner = msg.sender;
        time = block.timestamp;
    }
    
    function makeNFT(address _volunteer, uint _hour, string memory _what) public {
        require(owner == msg.sender);
        volunteerToOwner[volunteerNFTId] = _volunteer;
        volunteerToHour[volunteerNFTId] = _hour;
        volunteerToWhat[volunteerNFTId] = _what;
        
        nftToVote[volunteerNFTId] = true;
        
        volunteerNFTId = volunteerNFTId.add(1);
    }
    
    function addMaker(address _newMaker)public{
        require(owner == msg.sender);
        require(block.timestamp > (time + 35 days));
        newMaker[newMakerNum] = _newMaker;
        
        if(block.timestamp > (time + 35 days)){
            require(block.timestamp > time + 330 days);
            time = block.timestamp;
            newMakerNum.add(1);
        }
        
    }
    
    function addMaker1(address _newMaker)public{
       require(owner == msg.sender);
       newMaker[newMakerNum] = _newMaker;
       newMakerNum.add(1);
    }
    
    function addMaker2(address _newMaker)public{
        require(owner == msg.sender);
        require(block.timestamp > (time + 35 days));
        yetNewMaker = _newMaker;
        
        if(block.timestamp > (time + 35 days)){
            require(block.timestamp > time + 330 days);
            time = block.timestamp;
            if((volunteerNFTId.div(2)) > noCount){
                newMaker[newMakerNum] = yetNewMaker;
                newMakerNum.add(1);
            }
            
        }
    }
    
    function voteNo (uint _num) public returns(bool) {
        require(volunteerToOwner[_num] == msg.sender);
        if(nftToVote[_num] = false) {
            noCount.sub(1);
            return nftToVote[_num] = true;
        }
        noCount.add(1);
        return nftToVote[_num] = false;
    }
    
    
}
