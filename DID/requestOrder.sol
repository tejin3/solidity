
// 중복 지급을 막기 위한 체크 필요
// did를 저장해 두는지 하는 방법 등 필요

pragma solidity 0.8.9;

contract requestOrder {
    
    address public owner;    // 조사 업체
    struct survey {
        uint money;     // pay 지불할 돈
        uint howMany;   // 원하는 설문 수량
        uint howManyCount;      //원하는 설문 수량만큼만 비용을 지불하기 위해
        address company;       // 의뢰업체
    }    
    // 설문에 관한 정보를 모아둘 구조체
    survey[] public surveyData;     // 구조체 배열
    uint public surveyNumber = 0;     // 설문 번호
    event addSurvey(uint, uint, address, uint);     // 설문번호, 설문 한번당 지불할 비용, 의뢰업체, 원하는 설문 수량 이벤트
        
    constructor () {
        owner = msg.sender;
    }
    
    function makeYourSurvey (uint _money, uint _howMany)payable public {
      require(msg.value == _money * _howMany);       // 설문을 만들때 (설문한번당 지불할 비용 * 원하는 설문 수량)만큼의 wei 지불했는지 검증
      surveyData.push(survey(_money, _howMany, 0, msg.sender));       // survey구조체에 정보 삽입     
      emit addSurvey(surveyNumber, _money, msg.sender, _howMany);       // 설문번호, 설문 한번당 지불할 비용, 의뢰업체, 원하는 설문 수량 이벤트로 전달               
      surveyNumber++;       // 다음 설문번호 자동 셋팅
    }
}


// 과도기 함수들

 // function test() private {
    //      for(uint i = 0; i < surveyData[surveyNumber].howMany; i++){
    //   surveyUser[surveyNumber].push(owner);
    //   }
    // }
    

    // function checkOverlap(uint _surveyNum) public {
    //     for(uint i = 0; i < surveyData[_surveyNum].howMany; i++){
            
          
    //         if(tx.origin == surveyUser[_surveyNum][i]){
    //             break;
    //         }
    //     }
    //     pay(_surveyNum);
    // }


        // for(uint i = 0; i < surveyData[_surveyNum].howMany; i++){
        //     require(surveyUser[_surveyNum][i] != msg.sender);
        // }
        // 포문 돌리면 오류뜸
        
        // uint i = 0;
        // while (i < surveyData[_surveyNum].howMany) {
        //     if(surveyUser[_surveyNum][i] == tx.origin){
        //         break;
        //     }
        //     i++;
        // }

        
        // (bool success, ) = payable(tx.origin).call{value: surveyData[_surveyNum].money}("");
        // require(success, "Failed to send Ether");
        // 이 함수를 실행한 사람에게 의뢰업체가 정해둔 만큼의 wei 전송
