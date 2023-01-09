// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {BitwiseOperation} from "../../src/BitwiseOperation.sol";

import {BitwiseOperationFixtures} from "./BitwiseOperationFixtures.sol";

contract BitwiseOperationTest is Test {
    BitwiseOperation public bit;
    BitwiseOperationFixtures public fixtures;

    function setUp() public {
        bit = new BitwiseOperation();
        fixtures = new BitwiseOperationFixtures();
    }

    /*//////////////////////////////////////////////////////////////
                                 BASIC ATTRIBUTES
    //////////////////////////////////////////////////////////////*/
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

    /*//////////////////////////////////////////////////////////////
                                 PACKING LOGIC
    //////////////////////////////////////////////////////////////*/
    function _savePackedUserData() internal {
        bit.savePackedUserData(
            fixtures.USER_PSEUDO(),
            fixtures.USER_DAY(),
            fixtures.USER_MONTH(),
            fixtures.USER_YEAR(),
            fixtures.USER()
        );
    }

    function test_log_userData() public {
        _savePackedUserData();
        emit log_named_bytes32("userData", bit.userData());
    }

    function test_savePackedUserData_checkSavedPseudo() public {
        _savePackedUserData();
        assertEq(bit.getPseudo(), fixtures.USER_PSEUDO());
    }
}
