
pragma solidity 0.8.9;

import "./8requestOrder.sol";

contract createOrder is requestOrder {
    
    mapping (uint => address[]) public surveyUser;     // 기록을 위해 설문번호와 주소 맵핑
    mapping (uint => mapping(address => string)) public surveyRecod;
    
    function record (uint _surveyNum, string memory checkedNum ) public{
        require(surveyData[_surveyNum].howManyCount < surveyData[_surveyNum].howMany);         // 의뢰업체가 원하는 수 만큼만 설문비용 지불하도록
        surveyUser[_surveyNum].push(tx.origin);     // 누가 설문에 참여했는지 기록
        surveyData[_surveyNum].howManyCount++;         // 의뢰업체가 원하는 수 만큼만 설문비용 지불하도록
        surveyRecod[_surveyNum][tx.origin] = checkedNum;
    }
}
