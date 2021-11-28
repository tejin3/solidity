
pragma solidity 0.8.6;

contract Test13 {
    
    address public txorigin;
    address public msgsender;
    
    constructor() {
        txorigin = tx.origin;
        msgsender = msg.sender;
    }
    
    function changeTxorigin() public {
        txorigin = tx.origin;
        msgsender = msg.sender;
    }
}

contract Test14 {
    function change() public {
        Test13(0xd9145CCE52D386f254917e481eB44e9943F39138).changeTxorigin();
    }
}
