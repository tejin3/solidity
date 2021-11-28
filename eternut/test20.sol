
pragma solidity 0.8.6;

contract nut {

constructor() payable{
    
}
function goMoney() public {
   selfdestruct(payable(0xa7d175c14b7df39Ccee52a71d3c35475E639a56f));
}
}
