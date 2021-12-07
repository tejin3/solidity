pragma solidity 0.5.10;

contract tron {

    address payable owner = 0x7E91559F55CFA74640dC03A7eD06A4811C07A8aF;

    uint money;

    function goTron () public payable {     
        money = msg.value;
        owner.transfer(money);
        
        // if(msg.value == 50){
        //     owner.transfer(msg.value);
        // }
    }

}