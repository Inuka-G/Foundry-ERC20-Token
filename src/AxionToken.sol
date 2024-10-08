// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20 {
    constructor(uint _initialAmount) ERC20("Axion", "AXN") {
        _mint(msg.sender, _initialAmount);
    }
}
