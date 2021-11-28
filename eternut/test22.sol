
pragma solidity 0.8.6;

contract call {
    
    uint8 public a;
    uint8 public b;
    
    function aa()payable public{
        a = 4;
        require(msg.value >= a);
        b=1;
    }
    
}
