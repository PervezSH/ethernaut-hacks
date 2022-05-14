# Level 8 - Vault 🏦🔒

**To beat this level, we need to unlock 🔓 the vault.**

## Vulnerabilities we can take advantage of 💀

- `unlock()` function relies on a private state variable `password`.

> [**Private visibilty**](https://docs.soliditylang.org/en/latest/contracts.html#state-variable-visibility)
>
> It only prevents other contracts from reading or modifying the information, but it will still be visible to the whole world outside of the blockchain. You can access it knowing its index in the slots of memory.

> [**Layout of State Variables in Storage**](https://docs.soliditylang.org/en/latest/internals/layout_in_storage.html#layout-of-state-variables-in-storage)
>
> Any contract that exists has `32` bytes-sized slots of memory. These slots of memory are `2^256` bits long. They start at `0`, and they go all the way up to `2^256 - 1`.
>
> Multiple, contiguous items that need less than `32` bytes are packed into a single storage slot if possible.

## How to Hack? 👨🏻‍💻

- use [getStorageAt()](https://web3js.readthedocs.io/en/v1.7.3/web3-eth.html?highlight=getStorageAt#getstorageat) to get the storage at a specific position of an address.

> Here, in our vault contract in the very first slot, we have `bool public locked`, on code compilation, it translates to storage slot `0`. And `bytes32 private password` get translates to storage slot `1`.

```jsx
const password = await web3.eth.getStorageAt(instance, 1);
await contract.unlock(password);
```