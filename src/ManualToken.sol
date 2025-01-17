// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract ManualToken {
    mapping(address => uint) private s_balances;

    function name() public pure returns (string memory) {
        return "Axion Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
