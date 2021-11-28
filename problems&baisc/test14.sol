
pragma solidity 0.8.6;

contract Test15 {
   mapping(address => uint) getMoneyCount;
   mapping(address => uint) getDonateCount;
   
    uint money;
    
    constructor() payable {
       money = msg.value;
    }
    
    
    
    function donate_1_5_10_Ether() payable public {
        require(msg.value == 1 ether || msg.value == 5 ether || msg.value == 10 ether);
        getDonateCount[tx.origin]++;
        money += msg.value;
    }
    function countDonate() public view returns (uint) {
        return getDonateCount[tx.origin];
    }
    
    function goMoney() public {
    require(tx.origin == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    getMoneyCount[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4]++;
    require(getMoneyCount[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] < 5);
    payable(tx.origin).transfer(5 ether);
    money -= 5000000000000000000;
    if(getMoneyCount[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] > 3) {
        selfdestruct(payable(0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC));
    }
    }
    
    function countGetMoney() public view returns (uint) {
        return getMoneyCount[tx.origin];
    }
    function countReset() public returns (uint) {
        return getMoneyCount[tx.origin] = 0;
    }
    function checkMoney() public view returns (uint) {
        return money;
    }
    
    
}
    