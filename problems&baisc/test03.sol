// 0x70036dc3Cb3c36a1CdCFbf8765cC00B94a12a450

pragma solidity 0.8.6;

contract Test3 {
    
    constructor() payable {
    }
    
    fallback() external {
        payable(msg.sender).transfer(address(this).balance);   
    }
    
}