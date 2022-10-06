const main = async() => {
	//if running in node
	const hre = require ("hardhat");
	const piggybankContractFactory = await hre.ethers.getContractFactory("PiggyBank");
	const piggybankContract = await piggybankContractFactory.deploy();
	await piggybankContract.deployed();
	console.log("Contract deployed to ", piggybankContract.address);


	let txn = await piggybankContract.mint(1000)
}

