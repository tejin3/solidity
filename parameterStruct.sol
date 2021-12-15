pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

contract ERC721Base{

struct Fee {
        address payable recipient;
        uint256 value;
    }

    mapping(uint256 => Fee[]) public fees;

// [["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", 500]]

    function test(uint256 tokenId, Fee[] memory _fees) public {
        
        fees[tokenId].push(_fees[0]);
        
    }

}