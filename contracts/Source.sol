pragma solidity ^0.5.16;

//import './realational.sol';

contract Source {
    
    mapping(address => source) private sources;
    address[] private sourceIndexes;
    
    
    struct source {
        string name;
        string description;
        uint timeCreated;
        uint index;
        address[] realationalIndex;
        //mapping(address => string) relationships; 
    }
    
    modifier _sourceExists() {
        require(sourceIndexes[sources[msg.sender].index] == msg.sender, "There is no source to modify");
        _;
    }
    
    modifier _sourceNotExists() {
        if (sourceIndexes.length != 0) {
            require(sourceIndexes[sources[msg.sender].index] != msg.sender, "There is already a source associated with this address");
        }
        _;
    }
    
    function addSource(string memory _name, string memory _description, uint _timeCreated) public _sourceNotExists{
        sources[msg.sender].name = _name;
        sources[msg.sender].description = _description;
        sources[msg.sender].timeCreated = _timeCreated;
        sources[msg.sender].index = sourceIndexes.length;
        sourceIndexes.push(msg.sender);
    }
    
    function getSource(address _address) view public returns(string memory, string memory, uint, uint, address[] memory){
        source memory _source = sources[_address];
        return (_source.name, _source.description, _source.timeCreated, _source.index, _source.realationalIndex);
    }
    
    function updateName(string memory _name) public _sourceExists{
        sources[msg.sender].name = _name;
    }
    
    function updateDescription(string memory _description) public _sourceExists{
        sources[msg.sender].description = _description;
    }
    
    function updateTimeCreated(uint _timeCreated) public _sourceExists{
        sources[msg.sender].timeCreated = _timeCreated;
    }
}

