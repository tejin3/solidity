
pragma solidity 0.8.6;


import "./safemath.sol";

contract Buy {
    
    using SafeMath for uint256;
    
    address owner;
    uint public cubeLimit = 0;
    uint public allCubeLimit;
    uint public cubeId = 0;
    uint public withId = 0;
    uint public cubePrice;
    
    mapping (uint => address) public cubeToOwner;
    mapping (address => uint) public ownerCubeCount;
    mapping (uint => int) public cubeX;
    mapping (uint => int) public cubeY;
    mapping (uint => int) public cubeZ;
    
    mapping (uint => uint[]) public withToCubeId;
    mapping (uint => address[]) public withToOwnerAddress;
    // mapping (uint => mapping( uint => address)) public withToOwner;
    
    constructor(){
        owner = msg.sender;
    }
    
    function setWith() private{
        for(uint i = cubeId; i < (cubeLimit + cubeId); i = i.add(1)){
            // withToOwner[withId][i] = cubeToOwner[i];
            withToCubeId[withId].push(i);
        }
        withId = withId.add(1);
    }
    
    
    function setCubeLimit(uint _cubeLimit) public {
        require(owner == msg.sender);
        require(cubeId == allCubeLimit);
        cubeLimit = _cubeLimit;
        allCubeLimit += cubeLimit;
        setWith();
    }
    
    function setCubePrice(uint _cubePrice) public {
        require(owner == msg.sender);
        require(cubeId == allCubeLimit);
        cubePrice = _cubePrice;
    }
    
    
    function cubeBuy(int _x, int _y, int _z) public payable{
        require(msg.value == cubePrice);
        require(cubeId < allCubeLimit);
        cubeToOwner[cubeId] = msg.sender;
        withToOwnerAddress[withId -1].push(cubeToOwner[cubeId]);
        // withToOwner[withId -1][cubeId] = cubeToOwner[cubeId];
        cubeId = cubeId.add(1);
        payable(0xee442796570052932841B7588AB037255CE81183).transfer(address(this).balance);
        ownerCubeCount[msg.sender] = ownerCubeCount[msg.sender].add(1);
        
        cubeX[cubeId] = _x;
        cubeY[cubeId] = _y;
        cubeZ[cubeId] = _z;
    }
 
}
