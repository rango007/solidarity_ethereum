pragma solidity ^0.5.0;

contract Escrow {
    
    address agent;  //state variable
    mapping(address => uint256) public deposits;
    
    //modifier function gets evaluated every time any function calls it
    modifier onlyAgent(){
        require (msg.sender == agent);
        _;   //return
    }
    
    
    constructor() public {
        agent = msg.sender; //msg.sender is assgigned the address which deployed the smart contract
        
    }
    //hold the amount for payee
    function deposit(address payee) public onlyAgent payable {  // stores the amount in deposits to be sent to payee, payee is seller of house here
        uint256 amount = msg.value;  //msg.value contains the ether to be sent to payee
        deposits[payee] = deposits[payee] + amount;   //use safemath here for serious code

    }
    
    //withdrw amount to payee after transaction
    function withdraw(address payable payee) public onlyAgent { //withdraws the amount in deposits to payee
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }
}
