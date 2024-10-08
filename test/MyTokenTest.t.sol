// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {MyToken} from "../src/AxionToken.sol";
import {DeployMyToken} from "../script/DeployMyToken.s.sol";

contract MyTokenTest is Test {
    uint public constant INITIAL_INUKAg_AMOUNT = 100 ether;
    MyToken public AXN;
    DeployMyToken public deployMyToken;
    address inukaG = makeAddr("inukaG");
    address inukaG2 = makeAddr("inukaG2");

    function setUp() public {
        deployMyToken = new DeployMyToken();
        AXN = deployMyToken.run();
        vm.prank(msg.sender);
        AXN.transfer(inukaG, INITIAL_INUKAg_AMOUNT);
    }

    function testInukaGBalance() public {
        assertEq(AXN.balanceOf(inukaG), INITIAL_INUKAg_AMOUNT);
    }

    function testAllowance() public {
        // TRANSFER FROM AND APPROVE
        uint initial_allowance = 30 ether;
        vm.prank(inukaG);
        AXN.approve(inukaG2, initial_allowance);
        vm.prank(inukaG2);
        AXN.transferFrom(inukaG, inukaG2, 5 ether);
        assertEq(AXN.balanceOf(inukaG2), 5 ether);
        assertEq(AXN.balanceOf(inukaG), INITIAL_INUKAg_AMOUNT - 5 ether);
    }
}
