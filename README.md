# Truffle Tutorial 2: Open Zeppelin

That's a run through of the [Open Zeppelin Tutorial][ozt] on the Truffle main site.
[ozt]:http://truffleframework.com/tutorials/robust-smart-contracts-with-openzeppelin

> In this tutorial we will be covering:
> - Unboxing the front-end application
> - Creating the "TutorialToken" smart contract
> - Compiling and deploying the smart contract
> - Interacting with the new token


_If you go through the commits in this repo one by one you will see step by step how this
tutorial progresses, and you can follow the progress in this file below._


## Progress

### Running `truffle unbox`

    root@eth1:~/TUTORIALS/2_open_zeppelin# truffle unbox tutorialtoken
    Downloading...
    Unpacking...
    Setting up...
    Unbox successful. Sweet!

    Commands:

      Compile:        truffle compile
      Migrate:        truffle migrate
      Test contracts: truffle test
      Run dev server: npm run dev

### Installing `zeppelin-solidity`

    root@eth1:~/TUTORIALS/2_open_zeppelin# npm install zeppelin-solidity
    npm WARN tutorialtoken@1.0.0 No repository field.
    npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.1.3 (node_modules/fsevents):
    npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.1.3: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

    + zeppelin-solidity@1.8.0
    added 8 packages in 6.737s
