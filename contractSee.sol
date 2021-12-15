pragma solidity ^0.6.12;

contract HasContractURI  {

    string public contractURI;

    constructor(string memory _contractURI) public {
        contractURI = _contractURI;   
    }
}

contract test is HasContractURI{

    constructor(string memory contractURI) public HasContractURI(contractURI) {
    }
}