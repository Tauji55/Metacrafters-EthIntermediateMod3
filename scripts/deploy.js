async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);


    const MyToken = await ethers.getContractFactory("MyToken");


    const myToken = await MyToken.deploy(deployer.address);

    await myToken.deploymentTransaction().wait(1);

    console.log("MyToken deployed to:", myToken.target);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
