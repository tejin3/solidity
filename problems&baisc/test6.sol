
pragma solidity 0.8.6;

contract attendanceCheck {
    
    mapping(string => uint) public check;
    mapping(address => string) public name;
    
    
    constructor() {
        
    }
    
    
    
    function setName(string memory _name) public {
    
  
        name[msg.sender] = _name;
        
     
        
        check[_name] = 1;
    }
    
    
    function dayOff() public {
        require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        
    }
    
    
}
