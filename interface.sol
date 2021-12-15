pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

contract Market {

    uint8 public constant SIDE_SELL = 1;
    uint8 public constant SIDE_BUY = 2;

    uint8 public constant STATUS_OPEN = 0;
    uint8 public constant STATUS_ACCEPTED = 1;
    uint8 public constant STATUS_CANCELLED = 2;

    IERC721 public hello;

    struct Offer {
        uint256 tokenId;
        uint256 price;
        IERC721 nft;
        address user;
        address acceptUser;
        uint8 status;
        uint8 side;
    }

    function test(IERC721 aa) public {
        hello = aa;
    }
}

