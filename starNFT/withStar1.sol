
pragma solidity 0.8.6;

import "./ERC721.sol";
import "./safemath.sol";

contract WithStar is ERC721 {
 

 mapping(address => uint)WithStarCount;
 mapping(uint => uint[]) public WithStarToOwner;
 mapping(uint => address)WithStarApprovals;
 
 address star;
 
constructor(){
    star = msg.sender;
}
 
using SafeMath for uint256;


  function balanceOf(address _owner) public override view returns (uint256 _balance) {
    // return WithStarCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public override view returns (address _owner) {
  
  }

 function _transfer(address _from, address _to, uint256 _tokenId) private {
 
    WithStarToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transfer(address _to, uint256 _tokenId) override public{
    
  }

  function approve(address _to, uint256 _tokenId) override public{
   
  }

  function takeOwnership(uint256 _tokenId) override public {
      require(WithStarApprovals[_tokenId] == msg.sender);
    address star = ownerOf(_tokenId);
    _transfer(star, msg.sender, _tokenId);
  }
}
