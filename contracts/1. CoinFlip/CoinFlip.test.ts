import { expect } from "chai";
import { Contract } from "ethers";
import { ethers } from "hardhat";
import helper from "./CoinFlipHelper"

let attacker: Contract;
let victim: Contract;

describe("Attacking CoinFlip", function () {
  before(async () => {
    const Victim = await ethers.getContractFactory("CoinFlip");
    const Attacker = await ethers.getContractFactory("AttackingCoinFlip");

    victim = await Victim.deploy();
    attacker = await Attacker.deploy(victim.address);
  });

  // Get this to pass!
  it("Succesfully guessess the correct outcome 10 times in a row", async () => {
    await helper(attacker, 10);
    const consecutiveWins = await victim.consecutiveWins();
    expect(consecutiveWins).to.be.equal(10);
  });
});
