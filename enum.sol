pragma solidity ^0.5.0;

contract test {
   enum FreshJuiceSize{ SMALL, MEDIUM, LARGE }
   FreshJuiceSize choice;
   FreshJuiceSize constant defaultChoice = FreshJuiceSize.MEDIUM;
   FreshJuiceSize constant defaultChoice1 = FreshJuiceSize.LARGE;


//    function setLarge() public {
//       choice = FreshJuiceSize.LARGE;
//    }
function setLarge() public {
      choice = FreshJuiceSize.LARGE;
   }
function setMEDIUM() public {
      choice = FreshJuiceSize.MEDIUM;
   }
function setSMALL() public {
      choice = FreshJuiceSize.SMALL;
   }      
   function getChoice() public view returns (FreshJuiceSize) {
      return choice;
   }
   function getDefaultChoice() public pure returns (uint) {
      return uint(defaultChoice);
   }
   function getDefaultChoice1() public pure returns (uint) {
      return uint(defaultChoice1);
   }
}