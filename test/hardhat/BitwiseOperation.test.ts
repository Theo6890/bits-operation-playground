import { expect } from 'chai';
import { ethers } from 'hardhat';

describe('BitwiseOperation', function () {
    /*//////////////////////////////////////////////////////////////
                                 BASIC ATTRIBUTES
    //////////////////////////////////////////////////////////////*/
    it('Should return name BitwiseOperation', async function () {
        const BitwiseOperation = await ethers.getContractFactory(
            'BitwiseOperation'
        );
        const bitwiseoperation = await BitwiseOperation.deploy();
        await bitwiseoperation.deployed();

        expect(await bitwiseoperation.name()).to.equal('BitwiseOperation');
    });
});
