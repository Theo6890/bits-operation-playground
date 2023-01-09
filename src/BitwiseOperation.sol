// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * @notice Playground to understand by practice bitwise operations in solidity
 *         in many different cases.
 */
contract BitwiseOperation {
    /** @dev Contains packed user data:
     * bytes8 pseudo; uint8 day; uint8 month; uint8 year; address user
     */
    bytes32 public userData;

    bytes32 public constant PSEUDO_MASK =
        bytes32(uint256(0xffffffffffffffff << 192));
    bytes32 public constant DAY_MASK = bytes32(uint256(0xff << 184));
    bytes32 public constant MONTH_MASK = bytes32(uint256(0xff << 176));
    bytes32 public constant YEAR_MASK = bytes32(uint256(0xffff << 160));
}
