// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyTokenProject {
    string public name = "EduCoin";
    string public symbol = "EDC";
    uint256 public totalSupply;
    address public owner;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 _initialSupply) {
        owner = msg.sender;
        totalSupply = _initialSupply;
        balanceOf[owner] = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Insufficient Balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function mint(uint256 _amount) public {
        require(msg.sender == owner, "Only owner can mint");
        totalSupply += _amount;
        balanceOf[owner] += _amount;
    }

    function burn(uint256 _amount) public {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance to burn");
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
    }
}

