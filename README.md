# Project
This is a smart contract that represents a basic token with minting and burning functionality. It makes use of assert, revert, and require statements

## Description
This smart contract provides a basic implementation of a token with the ability to mint new tokens and burn existing ones.


## Getting Started

### Installing

Run this on gitpod and use truffle
```
truffle develop

compile
migrate

// Reminder that these are just sample addresses
let instance = await HelloWorld.deployed()
instance.checkBalance("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")
instance.mint("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", 200)
instance.checkBalance("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")
instance.burn("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", 2000)
instance.checkBalance("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")
instance.burn("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", 20)
instance.checkBalance("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")
```

Alternatively:
* Open [Remix IDE](https://remix.ethereum.org/).
* Create a new file and paste the `HelloWorld` contract code into the file.
* Compile and Deploy

### Executing program
* Compile the contract.
* Deploy the contract.

## Help
For any issues, please create an issue

## Authors
Patrick James Dionisio
