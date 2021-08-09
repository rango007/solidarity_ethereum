//libraries and math functions
// you only have to deploy MyContract

pragma solidity 0.5.1;

import "./Math.sol"; //imports library
contract MyContract{
    uint256 public value;
    function calculate(uint _value1, uint _value2) public {
        value = Math.divide(_value1, _value2); // to use divide function from Math library
    }
}
