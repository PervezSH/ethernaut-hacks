# Level 2 - Fallout

**To beat this level, we need to claim the ownership of the contract.**

## Vulnerabilities we can take advantage of:

- Smart Contract has a public function that can claim the ownership of the contract.

> [Public Function](https://docs.soliditylang.org/en/latest/contracts.html#function-visibility): Public functions are part of the contract interface and can be either called internally or via message calls. Public functions can be called by anyone.

## How to Hack?

- Just call the `Fal1out()` function.
```jsx
await contract.Fal1out();
```
That's all we need to do to claim the ownership😎 of the contract.