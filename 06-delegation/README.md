#  Level 6 - Delegation 😊

We're given two contracts this time, **Delegate** and **Delegation**. And we can only interact with Delegation.

**To beat this level, we need to claim the ownership 👑 of the Delegate contract.**

## Vulnerabilities we can take advantage of 💀

- `pwn()` of Delegate contract, which can claim the ownership, is a [public](https://docs.soliditylang.org/en/latest/contracts.html#function-visibility) function.
- `fallback()` of the Delegation contract can `delegatecall()` the Delegate contract with `msg.data`.

> [**Fallback Function**](https://docs.soliditylang.org/en/latest/contracts.html#fallback-function)
>
> The fallback function is executed on a call to the contract if none of the other functions match the given function signature.

> [**Delegatecall**](https://docs.soliditylang.org/en/latest/introduction-to-smart-contracts.html#delegatecall-callcode-and-libraries)
>
> There exists a special variant of a message call, named `delegatecall` which is identical to a message call apart from the fact that the code at the target address is executed in the context of the calling contract.
>
> In case of a message call, if `you` call a function on contract `A`, that calls a function inside contract `B` then code inside this function will get executed using `B`'s state variable. And here `msg.sender` will be `A`.
> 
> `You` -> `A` -> `B` -> (executes code with `B`'s state variable) (`msg.sender = A`)
>
> Whereas in the case of delegatecall, if `you` call a function on contract `A`, that calls a function inside contract `B` then code inside this function will get executed using `A`'s state variable. And here `msg.sender` will be `you`.
>
> `You` -> `A` -> `B` -> (executes code with `A`'s state variable) (`msg.sender = you`)

> [**msg.data**](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#block-and-transaction-properties)
>
> An unlimited size byte array specifying the input data of a message call.
> - The function it needs to call.
> - The arguments for the function.

## How to Hack? 👨🏻‍💻

Trigger `fallback()` function of **Delegation** with `msg.data` containing the function signature of `pwn()` of **Delegate**.

> `await contract.anyFunctionName()` will not work because the contract abi of **Delegation** doesn't contain `anyFunctionName()`. So we need to use [`sendTransaction()`](https://web3js.readthedocs.io/en/v1.2.11/web3-eth.html?highlight=call#sendtransaction)

```jsx
await web3.eth.sendTransaction({
    from: player,
    to: instance,
    data: web3.eth.abi.encodeFunctionSignature({
            name: 'pwn',
            type: 'function',
            inputs: []
        })
});
```

That's all we need to do to claim the ownership😎 of the contract.