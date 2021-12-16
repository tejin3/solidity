pragma solidity 0.5.6;

contract test {

    
    uint256 public waitingTime;
    mapping (address => uint256) public addressToDeposit;
    mapping (address => uint256) public addressToDepositTime;

    address owner;

    constructor() public {
        owner = msg.sender;
    }


    function timeSetting (uint _waitingTime) external {        
        require(msg.sender == owner);        
        waitingTime = _waitingTime;     
    }
    
    function deposit() public payable {        
        addressToDepositTime[msg.sender] = now;
        addressToDeposit[msg.sender] = msg.value;
    }

    //now는 초 단위
    function withdrawal () public {
        require(addressToDepositTime[msg.sender] != 0 && waitingTime != 0, "please time setting");
        require(now - addressToDepositTime[msg.sender] > waitingTime, "wait");
        msg.sender.transfer(addressToDeposit[msg.sender]);
    }
}