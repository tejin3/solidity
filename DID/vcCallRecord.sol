
pragma solidity 0.8.9;

contract vcCallRecord {
    
    address owner;
    //  
    
    // mapping  (address =>mapping(uint => string)) public vcCallList;
    mapping  (address => string[]) public vcCallList;
    mapping (address => uint[]) public vcCallDate;
       
    event vcCallApprovals (address,string[],uint);


    constructor () {
        owner = msg.sender;
    }


    //
    function vcCall (string[] memory _data) public {
    //  require(msg.sender == owner);
    for(uint i =0; i < _data.length; i++){
        
     vcCallList[tx.origin].push(_data[i]);
    }
    //  vcCallList[tx.origin].push(_vc);
    //  vcCallList[tx.origin][vcCallCount[tx.origin]] = vc;
     vcCallDate[tx.origin].push(block.timestamp);
     emit vcCallApprovals( tx.origin, _data, block.timestamp);
        // 디비저장
    }
    
    function callData(address _user) public returns(string[] memory, uint[] memory){
        return (vcCallList[_user] , vcCallDate[_user]);
    }
    

}
