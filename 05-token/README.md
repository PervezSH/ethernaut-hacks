# Level 5 - Token 🪙

**To beat this level, we need to somehow, get our hands on any additional tokens.**

## Vulnerabilities we can take advantage of 💀

- `transfer()` function performing arithmetic operations without checking **overflows** and **underflows**.

> [**Overflows and Underflows:**](https://docs.soliditylang.org/en/v0.8.13/security-considerations.html#two-s-complement-underflows-overflows)
>
> Let's say we have a `uint8`, which can only have `8` bits. That means the largest number we can store is binary `11111111` (or in decimal, `2^8 - 1 = 255`).
> 
> Now if we increase it by `1` — the number is counterintuitively equal to `0` even though we increased it. (If you add `1` to binary `11111111`, it resets back to `00000000`, like a clock going from `23:59` to `00:00`).
> 
> An underflow is similar, where if you subtract `1` from a `uint8` that equals `0`, it will now equal `255` (because uints are unsigned, and cannot be negative).

## How to Hack? 👨🏻‍💻

We can get our hands on any additional tokens by causing `balances[msg.sender]` to **underflow**.

- To cause underflow call `transfer()` by passing a value greater than `20`.

```jsx
await contract.transfer(instance, 21);
```