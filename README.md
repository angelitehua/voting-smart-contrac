# Voting Smart Contract

A minimal voting smart contract written in Solidity. Built as an educational project to better understand the structure of a smart contract and core EVM concepts.

>  **Educational project — NOT audited. Do NOT use in production.**

##  Features

- Create proposals at deployment through the constructor
- Cast one vote per address (double-voting is blocked)
- Track the vote count for each proposal
- Emit an event on every vote
- Query the winning proposal

##  Concepts practiced

- Structs, dynamic arrays, and mappings
- `require` validations and the checks-effects pattern
- Events with `indexed` parameters
- `for` loops and storage vs memory

##  How to deploy (Remix)

1. Open the contract in [Remix](https://remix.ethereum.org)
2. Compile with Solidity `>=0.6.12 <0.9.0`
3. In the deploy field, pass an array of proposal names, for example: ["Pizza","Tacos","Hot Dogs"]
