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
    function test_constant_PseudoMask() public {
        assertEq(
            uint256(bit.PSEUDO_MASK()),
            // bytes8 at 1 for pseudo; bytes24 at 0
            0xffffffffffffffff000000000000000000000000000000000000000000000000
        );
    }

    function test_constant_DayMask() public {
        assertEq(
            uint256(bit.DAY_MASK()),
            // bytes8 at 0 for pseudo; bytes1 at 1 for day; bytes23 at 0
            0x0000000000000000ff0000000000000000000000000000000000000000000000
        );
    }

    function test_constant_MonthMask() public {
        assertEq(
            uint256(bit.MONTH_MASK()),
            // bytes8 at 0 for pseudo; bytes1 at 0 for day; bytes1 at 1 for month; 22 bytes at 0
            0x000000000000000000ff00000000000000000000000000000000000000000000
        );
    }

    function test_constant_YearMask() public {
        assertEq(
            uint256(bit.YEAR_MASK()),
            // bytes8 at 0 for pseudo; bytes1 at 0 for day; bytes1 at 1 for month; bytes2 at 1 for year;
            0x00000000000000000000ffff0000000000000000000000000000000000000000
        );
    }
}