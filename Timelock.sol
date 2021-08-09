//To lock ethereum for a specific time in a savings account
//we are using _variableName for Local variables and variableName for state variables
// constructor gets called only once when a smart contract is deplyed
// we use unixtimestamp.com for time in seconds
pragma solidity ^0.5.1;

contract Timelock {
    // we want to lock some crypto for a specific person for some time
    //who can withdraw?
    //how much?
    //when?
    
    address payable beneficiary;
    uint256 releaseTime;
    
    constructor(
        address payable _beneficiary,
        uint256 _releaseTime
        )
        public 
        payable
        {
        require(_releaseTime > block.timestamp); //block.timestamp gives current time in seconds
        beneficiary = _beneficiary; 
        releaseTime = _releaseTime;
    }
    
    function release() public {
        require(block.timestamp >= releaseTime);
        address(beneficiary).transfer(address(this).balance);  // this line sends all ether in this smart contract to beneficiary
        
    }
    
}
