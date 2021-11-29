// 0xF1895232940b1eA9DfFc5927DC005A4f198BD5F7

pragma solidity 0.8.6;

contract Test6 {
    
    constructor() payable {
        
    }
    
    function destroy() public {
        selfdestruct(payable(msg.sender));
    }
    
}