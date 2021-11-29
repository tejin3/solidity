
pragma solidity 0.8.6;

contract Test12 {
   
   
   function gamble() public {
       
       uint blockNum = block.number;
        bool answer;
        
        if(blockNum % 2 == 1){
            answer = true;
        } else if (blockNum % 2 == 0) {
            answer = false;
        }
        
        Test11(0xd9145CCE52D386f254917e481eB44e9943F39138).gamble(answer);
   }
}
