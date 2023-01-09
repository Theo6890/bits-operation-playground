// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/BitwiseOperation.sol";

contract DeployBitwiseOperation is Script {
    function run() external {
        ///@dev Configure .env file
        string memory SEED = vm.envString("SEED");
        uint256 privateKey = vm.deriveKey(SEED, 0); // address at index 0
        vm.startBroadcast(privateKey);

        BitwiseOperation bitwiseoperation = new BitwiseOperation();

        vm.stopBroadcast();
    }
}
