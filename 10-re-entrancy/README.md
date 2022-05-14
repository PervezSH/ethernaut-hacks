# Level 10 - Re-entrancy ➿

**To beat this level, we need to o steal all the funds 💰 from the contract.**

## Vulnerabilities we can take advantage of 💀

- `withdraw()` function of Reentrance contract is making a `call()` to send ether and then updating state `balances[msg.sender]`.

> **Why doing so is vulnerable?**
> 
> ![reentrancy.svg](/10-re-entrancy/reentrancy.svg)
>
> Say a contract with either `receive()` or payable `fallback()` function calls `withdraw()` function of Reentrance contract. `withdraw()` function checks if the contract has enough ether to withdraw, then sends ether to that address. It triggers the `receive()` or payable `fallback()` function of that contract, which then again calls `withdraw()` function of the Reentrance contract. And as the balance of this contract inside the Reentrance contract didn't get updated during the last call it will pass the check and continue sending ether to the contract.
> 
> It keeps going since the balance is updated in the last line of the `withdraw()` function. Since it is not reached it keeps on looping between `withdraw()` function and `receive()` or `fallback()` function withdrawing ether from the Reentrace contract.
> 
> A recommended way of writing function is to first make all of your checks, then update states, and then finally make external calls.

## How to Hack? 👨🏻‍💻

Deploy a [contract](/10-re-entrancy/AttackReentrance.sol) containing a `receive()` function (calling `withdraw()` function of the Reentrance contract), and an `attack()` function that would first deposit some ether to the Reentrance contract and then would call the `withdraw()` function.

## TL;DR 🙂
Deploy [AttackReentrance](/10-re-entrancy/AttackReentrance.sol) on **Remix** with value of  0.001 Ether (the amount the reentrance contract was seeded with), and call `attack()` function to beat this level.

**You need to manually increase the gas limit in the metamask prompt or else the reentrancy calls will not succeed.**