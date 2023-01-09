const hre = require('hardhat');

// npx hardhat run --network goerli scripts/deploy.js
async function main() {
    const BitwiseOperation = await hre.ethers.getContractFactory(
        'BitwiseOperation'
    );
    const bitwiseoperation = await BitwiseOperation.deploy();

    await bitwiseoperation.deployed();

    console.log(`Deployed to ${bitwiseoperation.address}`);

    await hre.run('verify:verify', {
        address: bitwiseoperation.address,
        // see: https://hardhat.org/hardhat-runner/plugins/nomiclabs-hardhat-etherscan#using-programmatically
        constructorArguments: [],
    });
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
