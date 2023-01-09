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

    /**
     * @dev 8 first bytes (= 192 bits) occupied by pseudo, bits from 192 to
     * 184 are reserved to the day
     */
    bytes32 public constant DAY_MASK = bytes32(uint256(0xff << 184));
    bytes32 public constant MONTH_MASK = bytes32(uint256(0xff << 176));
    bytes32 public constant YEAR_MASK = bytes32(uint256(0xffff << 160));
    bytes32 public constant USER_ADDR_MASK =
        bytes32(uint256(0xffffffffffffffffffffffffffffffffffffffffffff));

    function savePackedUserData(
        string memory pseudo,
        uint8 day,
        uint8 month,
        uint16 year,
        address user
    ) public {
        require(bytes(pseudo).length <= 8, "pseudo max 8 char");

        userData = bytes32(bytes(pseudo));
        userData |= bytes32(uint256(day)) << 184;
        userData |= bytes32(uint256(month)) << 176;
        userData |= bytes32(uint256(year)) << 160;
        userData |= bytes32(uint256(uint160(user)));
    }

    function getPseudo() external view returns (string memory) {
        return string(abi.encodePacked(bytes8(userData)));
    }

    /**
     * @dev 8 first bytes are occupied by the pseudo, after the mask has been
     *      applied these bits are free/zeroed. We can now move the day to the
     *      very left by 8 bytes, which is equal to 64 bits.
     */
    function getDay() external view returns (uint8) {
        return bytes32toUint8(bytes32(uint256(userData & DAY_MASK) << 64));
    }

    function getMonth() external view returns (uint8) {
        return bytes32toUint8(bytes32(uint256(userData & MONTH_MASK) << 72));
    }

    /**
     * @dev As solidity uses little endian, the most significant byte is on
     *      the right which is why taking only a uint160 on bytes32 will
     *      result in casting bytes20 on the most right end.
     *      As the user address is stored on the very right side we just have
     *      to cast the bytes32 in uint160 (compulsory cast to uint256 before)
     */
    function getUser() external view returns (address) {
        return address(uint160(uint256(userData)));
    }

    function getYear() external view returns (uint16) {
        return bytes32toUint16(bytes32(uint256(userData & YEAR_MASK) << 80));
    }

    function bytes32toUint8(bytes32 number) public pure returns (uint8) {
        return uint8(bytes1(number));
    }

    function bytes32toUint16(bytes32 number) public pure returns (uint16) {
        return uint16(bytes2(number));
    }
}
