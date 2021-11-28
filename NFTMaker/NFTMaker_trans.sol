
pragma solidity 0.8.7;

import "./ERC721.sol";

import "./NFTMaker.sol";

contract NFTMaker_trans is NFTMaker, ERC721 {

 mapping(uint => address)NFTApprovals;
//  mapping(uint => uint) public withStar;


  function balanceOf(address _owner) public override view returns (uint256 _balance) {
    return NFTCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public override  view returns (address _owner) {
    return NFTToOwner[_tokenId];
  }

  function _transfer(address _from, address _to, uint256 _tokenId) private {
    NFTToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transfer(address _to, uint256 _tokenId) override public{
    require(msg.sender == ownerOf(_tokenId));
    _transfer(msg.sender, _to, _tokenId);
  }

  function approve(address _to, uint256 _tokenId) override public{
    require(msg.sender == ownerOf(_tokenId));
    NFTApprovals[_tokenId] = _to;
    emit Approval(msg.sender, _to, _tokenId);
  }

  function takeOwnership(uint256 _tokenId) override public {
    require(NFTApprovals[_tokenId] == msg.sender);
    address owner = ownerOf(_tokenId);
    _transfer(owner, msg.sender, _tokenId);
  }
}
