pragma solidity ^0.4.18;

contract ClockAuctionBase {

    // Represents an auction on an NFT
    struct Auction {
        // Address of the NFT
        address nftAddress;
        // Current owner of NFT
        address seller;
        // Price (in wei) at beginning of auction
        uint128 startingPrice;
        // Price (in wei) at end of auction
        uint128 endingPrice;
        // Duration (in seconds) of auction
        uint64 duration;
        // Time when auction started
        // NOTE: 0 if this auction has been concluded
        uint64 startedAt;
    }

    mapping(uint256 => Auction) public helloo1;

 function createAuction(
        address _nftAddress,
        uint256 _tokenId,
        uint256 _startingPrice,
        uint256 _endingPrice,
        uint256 _duration
    )
        public
    {
        address seller = msg.sender;
      
        Auction memory auction = Auction(
            _nftAddress,
            seller,
            uint128(_startingPrice),
            uint128(_endingPrice),
            uint64(_duration),
            uint64(now)
        );
        test(_tokenId, auction);
    }

    function test(uint256 _a, Auction _hello) internal {
        helloo1[_a] = _hello;
    }
}