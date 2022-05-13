# Level 7 - Force 💪

**To beat this level, we need to make the balance of the contract greater than zero.**

## Vulnerabilities we can take advantage of 💀

- use `selfdestruct()`, there is no way to stop an attacker from sending ether to a contract.
> [**`selfdestruct`**](https://docs.soliditylang.org/en/latest/introduction-to-smart-contracts.html#deactivate-and-self-destruct)
> 
> Destroy the current contract, sending its funds to the given Address and end execution.

## How to Hack? 👨🏻‍💻


Deploy a [contract](/07-force/AttackForce.sol) that would self-destruct itself sending its fund to the given contract.

## TL;DR 🙂
Deploy [AttackForce](/07-force/AttackForce.sol) on **Remix** to beat this level. Don't forget to specify its value before deploying.