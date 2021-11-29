
pragma solidity 0.8.6;

contract hello {
    function getBlockNumber() public view returns(uint) {
        return block.number;
    }
}
    