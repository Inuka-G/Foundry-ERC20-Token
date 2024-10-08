// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {MyToken} from "../src/AxionToken.sol";

contract DeployMyToken is Script {
    function run() public returns (MyToken) {
        vm.startBroadcast();
        MyToken AXN = new MyToken(100 ether);
        vm.stopBroadcast();
        return AXN;
    }
}
