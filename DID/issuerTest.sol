
pragma solidity 0.8.9;

contract issuer {
    
    address DID;
    string publicKey;
    string privateKey;
    string encryptPublickey;
    mapping (address => bool) vcList;
    mapping (address =>string ) holder;
    // struct VC{
    //     address holder;
    //     string holderEncryptPublic;
    //     bool apporval;
    //     string encryptVC;
    // }
    
//   VC[] public VCs;
    
    constructor (string memory _publicKey, string memory _privateKey, string memory _encryptPublickey)  {
        DID = msg.sender;
        publicKey = _publicKey;
        privateKey = _privateKey;
        encryptPublickey = _encryptPublickey;
    }
    
    function vcApporval(string memory _holderEncryptPublic) public {
       holder[msg.sender] = _holderEncryptPublic;
       vcList[msg.sender] = false;
    }
    
    // 인증
    
    function checkedApporval(address _holder, string memory _holderEncryptPublic) public {
        require(msg.sender == DID);
        require(vcList[msg.sender] = false);
        vcList[_holder] = true;
        holder[msg.sender] = _holderEncryptPublic;
        // sendVC(_holder, _holderVC);
    }
    
    // function sendVC(address _holder, string memory _holderVC) public {
       
    // }
    
    // function sendVC(string memory _holderEncryptPublic ) public returns (memory string) {
    //     require(vcList[msg.sender] = true);
    //     string memory a = holder[msg.sender][_holderEncryptPublic];
    //     return(a);
        
    // }
}
