pragma solidity ^0.5.1;

contract MyContract {
/*    
  // Data types
    string public constant stringValue = "myValue";
    bool public myBool = true;
    int public myint = -1;
    uint public myuint = 10;

    function set(string memory _value) public {
    value = _value;
    }
  
  //enum
  enum State{waiting, ready, active}
  State public state;
  
  constructor() public{
      state = State.waiting;
  }
  
  function isactive() public view returns(bool){
      return state == State.active;
  }
  
  function activate() public {
      state= State.active;
  }
  
  function ready() public {
      state= State.ready;
  }
  
  
  //struct: way to define your own data structure
  //array through 0 indexing
  Person[] public people;
  
  uint256 public peopleCount;
  struct Person {
      string _firstName;
      string _lastName;
  }
  
  function addPerson(string memory _firstName, string memory _lastName) public {
      
      peopleCount += 1;
      people.push(Person(_firstName, _lastName));
      
  }
  
  //through mapping (connecting data to id)
  
  uint256 public peopleCount = 0;
  mapping(uint=>Person) public people;
  
  //only owner of dapp can add person
  
  address owner;  // datatype address
  //custom modifier
  modifier onlyOwner() {     
    require(msg.sender == owner);  // <-- it tells address of caller of function. solidity has global key word msg (function metadata)
    _;
  }
  struct Person {
      uint _id;
      string _firstName;
      string _lastName;
  }
  
  constructor() public{
      owner = msg.sender;
  }
  
  function addPerson(
      string memory _firstName, 
      string memory _lastName
      ) 
      public 
      onlyOwner 
      { //custom modifier (so that only owner of dapp can add person)
      incrementCount();
      people[peopleCount] = Person(peopleCount, _firstName, _lastName);
      
  }
  function incrementCount() internal{
       peopleCount += 1;
  }
  
  
  
  //run contract only after a specific time ex. for ico
  uint256 openingTime = 1720215625;  // use epochConverer for time in seconds for event's time
  modifier onlyWhileOpen() {     
    require(block.timestamp >= owner);  // <-- it tells current block's timestamp.
    _;
  }
  struct Person {
      uint _id;
      string _firstName;
      string _lastName;
  }
  
  function addPerson(
      string memory _firstName, 
      string memory _lastName
      ) 
      public 
      onlyWhileOpen 
      { //custom modifier (so that only owner of dapp can add person)
      incrementCount();
      people[peopleCount] = Person(peopleCount, _firstName, _lastName);
      
  }
  function incrementCount() internal{
       peopleCount += 1;
  }
  
  */
  
  
  
  // function to send ether(kind of like in ICO)
  
     
  mapping(address => uint256) public balances;  //track this person's balance
  address payable wallet;
  
  //you can use event to kind of see purchase history in a smart contract
  event Purchase(
      address indexed _buyer,
      uint256 _amount
      );
  constructor(address payable _wallet) public{
      wallet = _wallet;
  }
  
  //fallback function or fixed function to send eth to specific address for token
  function fallback() external payable{
      buyToken();
  }
  
  function buyToken() public payable{
      // buy a buyToken
      balances[msg.sender] +=1;
      // send ether to wallet
      wallet.transfer(msg.value);
      emit Purchase(msg.sender, 1);
      
  }
  
  
  
  
  
  
  
  
  
}
