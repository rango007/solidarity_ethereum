//inheritance (parent and child relationship in smart contaracts)
// smart contracts that talk to one another
//you only have to deploy one contract ie. second one
pragma solidity ^0.5.1;
 
  contract ERC20Token {
      string public name;
      mapping(address => uint256) public balances;
      
      
      constructor (string memory _name) public {
          name = _name;
      }
      
      function mint() public {
           balances[tx.origin] ++;
      }
  }
  
  contract MyToken is ERC20Token {
      string public symbol;
      address[] public owners;
      uint256 ownerCount;
      constructor (
          string memory _name, 
          string memory _symbol
          ) 
          ERC20Token(_name)
          public {
              symbol = _symbol;
          }
          
          function mint() public{
              super.mint();   // call the above mint function
              ownerCount ++;  //increment number of people who own the token
              owners.push(msg.sender);  //add them to array of owners
          }
          
          
          
}
