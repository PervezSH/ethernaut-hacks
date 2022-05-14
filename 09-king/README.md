# Level 9 - King 👑

**To beat this level, we need to break the King contract so that we don't lose kingship 👑.**

## Vulnerabilities we can take advantage of 💀

- `transfer()` is being used to send ether to the overthrown king.

> [**transfer()**](https://docs.soliditylang.org/en/latest/security-considerations.html#sending-and-receiving-ether)
> 
> `transfer()` is used to transfer plain ether. However, if neither a `receive()` nor a payable `fallback()` function is present, the contract cannot receive Ether through regular transactions (e.g. via `.send()` or `.transfer()`) and throws an exception.

## How to Hack? 👨🏻‍💻

Deploy a [contract](/09-king/AttackKing.sol) and make that contract claim the kingship.
- To see the current prize do this 👇
 ```jsx
(await contract.prize()).toString()
 ```
Make sure the deployed contract neither contains a `receive()` function nor a payable `fallback()` function.

## TL;DR 🙂

Deploy [AttackKing](/09-king/AttackKing.sol) on **Remix** to beat this level.