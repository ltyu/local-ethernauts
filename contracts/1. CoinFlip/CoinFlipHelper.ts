import { Contract } from "ethers";

const helper = async (attacker: Contract, winsTarget: number) => {
  for (let i = 0; i < winsTarget; i++) {
    await attacker.hackContract();
  }
};

export default helper;
