pragma solidity 0.8.4;

contract FirstContract {
    
    string name = "vitalik";



    function getName() public view returns (string memory) {
        return name;
    }
    
    function setName(string memory _name) public {
        name = _name;
    }
    
   
}
