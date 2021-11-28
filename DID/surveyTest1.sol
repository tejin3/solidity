
pragma solidity 0.8.9;

contract survey {
    
    address owner;
    //  
    
    // 중복체크 위해 사용 설문 번호=>유저 did or account => bool
    mapping (uint => mapping(address => bool)) public surveyUser;

    // 이벤트 바로 캣치 해서 디비에 저장할꺼면 안해도 됨
    // mapping (uint => address[]) public surveyCompleteList;
    // mapping (uint => uint) public surveyCount;
    // 이벤트 바로 캣치 해서 디비에 저장할꺼면 안해도 됨
    
    mapping (uint => mapping(address => mapping(address => string[]))) public whoCallVP;
    
    mapping(uint => string) public companyPublic;

    event addUser(uint, address);
    event recordVPList(uint, address, address, string);

    constructor () {
        owner = msg.sender;
    }
    
   
    // 
    function recordSurvey (uint _num)public {
     require(surveyUser[_num][tx.origin] == false);
    //  중복체크
      
        surveyUser[_num][tx.origin] = true;

    // 이벤트 바로 캣치 해서 디비에 저장할꺼면 안해도 됨
        // surveyCompleteList[_num].push(tx.origin);
        // surveyCount[_num]++;
    // 이벤트 바로 캣치 해서 디비에 저장할꺼면 안해도 됨


        emit addUser(_num , tx.origin);
        // 디비저장        
    }
    
    function recordVP (uint _num, string memory _VPData, address _company) public {
    //  require(surveyUser[_num][tx.origin] == true);
    
       
        whoCallVP[_num][_company][tx.origin].push(_VPData);
        

        emit recordVPList(_num , _company, tx.origin, _VPData);
        // 디비저장        
    }
    
    function companyEncrptPublic (uint _surveyId, string memory _publicKey)public {
        require(msg.sender == owner);
        companyPublic[_surveyId] = _publicKey;
    }
}
