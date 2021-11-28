
pragma solidity 0.8.9;

// 검증
// 이더리움이 아닌 바른 네트워크 상황 가정.
// 의뢰업체가 검증요청을 함
// 검증업체가 이벤트를 받아서 설문조사 참가자의 암호화된 공개키로 암호화 한 후 기록
// 시간이 지나면 자동적으로 기록 확인
// 의뢰업체 클라이언트에서 설문조사 참가자의 암호화된 공개키로 VC 암호화 한 후 대조.
// (의뢰업체가 아닌데 요청해도 학인 못하게(유사 영지식증명))
// 조작되었는지 확인
// VC데이터가 지금은 단순하지만 검증기관에서 ID 값을 같이 발행한다는 가정(의뢰업체가 때려 맞추지 못하게) 


contract issuer {
   
   address owner;
    // 검증 요청하면 기록됨. (검증번호, 설문조사 참가자 암호화된 공개키, 의뢰업체 주소, 요청시간)
    struct verificationRecode {
         uint VCsNum;
       string surveyUser;
        address surveyCompany;
        
        uint time; 
    }
     verificationRecode[] public verificationRecodes;
    // 검증번호,설문조사 참가자 암호화된 공개키, 의뢰업체 주소, 검증할 VC이름
    // 검증기관이 이벤트로 이 정보들을 받아서 체인에 바로 기록함
    event Approval (uint, string, address, string);
     
    // 검증번호, 설문조사 참가자 암호화된 공개키와 VC정보를 암호화한 데이터
     mapping (uint => string) public encryptForCompany;
     
     constructor(){
         owner = msg.sender;
     }
     
     function approval(string memory _surveyUser, string memory _VCName)public returns(uint){
         emit Approval (verificationRecodes.length, _surveyUser,  tx.origin, _VCName);
         verificationRecodes.push(verificationRecode(verificationRecodes.length, _surveyUser, tx.origin, block.timestamp));
         return verificationRecodes.length;
        //  이 정보를 갖고 encryptForCompany[verificationRecodes.length] 검색
     }
     
     function forCompany(uint _VCsNum, string memory _encrypt) public {
         require(owner == msg.sender);
         encryptForCompany[_VCsNum] = _encrypt;
     }
}
