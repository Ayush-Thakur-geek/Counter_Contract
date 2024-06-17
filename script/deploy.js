const { ethers, run, network } = require("hardhat");

async function main() {
  const counter = await ethers.getContractFactory("Counter");
  console.log("Deploying Counter...");
  const counterTnstance = await counter.deploy();
  await counterTnstance.waitForDeployment();
  console.log("Counter deployed to:", counterTnstance.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
