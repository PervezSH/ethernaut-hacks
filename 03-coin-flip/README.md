# Level 3 - Coin Flip

**To beat this level, we need to build up a winning streak by guessing the outcome of a coin flip.**

## Vulnerabilities we can take advantage of:

- The smart contract is relying upon blockhash, block number, and a given factor that can be reused.

> `blockhash()` and `block.number` are special variables and functions which always exist in the global namespace and are mainly used to provide information about the blockchain or are general-use utility functions.
> - `blockhash(uint blockNumber) returns (bytes32)`: hash of the given block when blocknumber is one of the 256 most recent blocks; otherwise returns zero.
> - `block.number` (`uint`): current block number

## How to Hack?

Deploy a [contract](/03-coin-flip/AttackCoinFlip.sol) that will calculate the outcome and then guess.

- Compute the `blockvalue` using `blockhash()` and `block.number()`.
- `FACTOR` is already known, use it to calculate `coinFlip` and then `side`.
- Pass calculated `side` as guess and call `flip()`.

## TL;DR
Deploy [`AttackCoinFlip`](/03-coin-flip/AttackCoinFlip.sol) on **Remix** and call `attack()` function 10 times to beat this level.