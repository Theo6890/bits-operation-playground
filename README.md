# <h1 align="center"> Bitwise Operations Playground </h1>

This repo is a playground to understand and to manipulate bits in Solidity. AND, OR, NOT, XOR, NAND, NOR & shifts (left & right) will not have any secret once completed.

We will look at libraries like: solidstate-contracts and solmate who both uses bitwise operations, e.g. to pack data with shifts and extract values with masks.

# Operations

1.  AND: `&`
2.  OR: `|`
3.  Shifts: left shift `<<`, right shift `>>`
4.  XOR: `^`
5.  NOT: `~`
6.  NAND: ~(`a & b`)
7.  NOR: ~(`a | b`)

# Important Reminders

All variables are stored as a bytes32, except if packed.

If a byte do not fill a bytes32 and not packed, it is always padded with zero on the LEFT hand side, which means we can omit 0 on LEFT side. This is due to **solidity using little endian ordering**, e.g.:

-   `0xff0000000000000000000000000000000000000000000000 == 0x0000000000000000ff0000000000000000000000000000000000000000000000`
-   `0x0000000000000000ff != 0x0000000000000000ff0000000000000000000000000000000000000000000000`

## Bytes Extraction

-   `bytes8(bytes32("lorem_ipsum user data"))` will extract the first 8 bytes on the left: `lorem_ip`

## Uint Extraction

-   Due to little endian encoding, extracting `uint` will result in taking the most given range of bits on **the right hand side**, e.g.:
    -   `bytes20(uint160(uint256(0x72646d5073646f31010407c049879f8ec1e36f659e4e576bf0aebf324efe4d11)))` will extract bytes20 on the very right hand side `49879f8ec1e36f659e4e576bf0aebf324efe4d11`
    -   `uint8(uint256(0x72646d5073646f31010407c049879f8ec1e36f659e4e576bf0aebf324efe4d11))` will extract the last bytes1 which `11` in hexadecimal and `17` in decimal
