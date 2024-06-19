
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.10;

contract HelloWorld {
    mapping(address => uint) private balances;

    function mint(address _address, uint _value) public {
        require(_value > 0, "Mint amount must be greater than zero!");
        balances[_address] += _value;
    }

    function burn(address _address, uint _value) public {
        if (balances[_address] < _value) {
            revert("Burn amount must be less than or equal the existing balance!");
        }

        balances[_address] -= _value;
    }

    function checkBalance(address _address) public view returns (uint) {
        assert(balances[_address] >= 0);
        return balances[_address];
    }
}
