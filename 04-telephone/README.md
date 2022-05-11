# Level 4 - Telephone ☎️

**To beat this level, we need to claim the ownership 👑 of the contract.**

## Vulnerabilities we can take advantage of 💀

- `if` statement using `tx.origin` as conditional args.

> `tx.origin` and `msg.sender` are special variables always exist in the global namespace.
> - `tx.origin`: sender of the transaction (full call chain)
> - `msg.sender`: sender of the message (current call)

> Let's say `you` call contract `A` and contract `A` calls Contract `B` then inside contract `B` `msg.sender` will be `A` and `tx.origin` will be `you`.
> 
> `You` -> `A` -> `B` (`msg.sender` = `A`) (`tx.origin` = `You`)

## How to Hack? 👨🏻‍💻

Deploy a [contract](/04-telephone/AttackTelephone.sol) that will call `changeOwner`() function of the original contract.

## TL;DR 🙂

Deploy [`AttackTelephone`](/04-telephone/AttackTelephone.sol) on **Remix**, set contract address and, call `attack()` function to beat this level.