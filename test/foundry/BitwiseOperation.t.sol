// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../../src/BitwiseOperation.sol";

contract BitwiseOperationTest is Test {
    BitwiseOperation public bit;

    function setUp() public {
        bit = new BitwiseOperation();
    }

    /*//////////////////////////////////////////////////////////////
                                 BASIC ATTRIBUTES
    //////////////////////////////////////////////////////////////*/
    function testTruthy() public {
        assertTrue(true);
    }
}
