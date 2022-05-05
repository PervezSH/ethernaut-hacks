# Level 1 - Fallback

**To beat this level, we need to claim the ownership of the contract and reduce its balance 0.**

## Vulnerabilities we can take advantage of:

- Smart Contract's Recieve Ether Function can take ownership of the contract.
  
> [Receive Ether Function](https://docs.soliditylang.org/en/v0.8.13/contracts.html?highlight=fallback#receive-ether-function): The receive function is executed on a call to the contract with empty calldata. This is the function that is executed on plain Ether transfers (e.g. via `.send()` or `.transfer()`). This function will be called every time we send ethers to the contract.

## How to Hack?

The only feasible way we can claim the ownership of the contract is by triggering the `receive` function and, then we also need to pass the `require` statement inside the `receive` function.

- To pass require statement, we will simply call `contribute` function and specify any value less than 0.001 ETH.
```jsx
// make a contribution of 0.0001 ETH
await contract.contribute({value: 100000000000000})
```

- To trigger the `receive` function, we can simply send ethers to the contract via `.sendTransaction()`.

```jsx
await contract.sendTransaction({value: 10000})
```

That's all we need to do to claim the ownership😎 of the contract.

Now that we're the owner of the contract, we can reduce its balance to 0.

```jsx
await contract.withdraw()
```
