const hre = require('hardhat');

async function main() {

  const StarWarsPromo = await hre.ethers.getContractFactory(
    'StarWarsPromo',
  );

  const name = "StarWarsPromo"
  const symbol = "SWP"

  const starWarsPromo = await StarWarsPromo.deploy(
    name,
    symbol
  );

  await starWarsPromo.waitForDeployment();

  console.log(`starWarsPromo deployed to ${await starWarsPromo.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});