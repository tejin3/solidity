
pragma solidity 0.8.6;

contract Quiz {
    
    constructor() payable {
        
    }
    
    function answer(string memory _answer) public {
        payable(msg.sender).transfer(address(this).balance);
    }
    
}