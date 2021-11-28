pragma solidity 0.8.7;

import "./ERC721.sol";

import "./basic_schoolAwads.sol";

contract schoolChange is schoolAwads, ERC721 {

  function balanceOf(address _owner) public override view returns (uint256 _balance) {
   
  }

  function ownerOf(uint256 _tokenId) public override  view returns (address _owner) {
    return schoolAwadsIdToOwner[_tokenId];
  }

  function transfer(address _to, uint256 _tokenId) override public{
  }

  function approve(address _to, uint256 _tokenId) override public{
  }

  function takeOwnership(uint256 _tokenId) override public {
  }
}
