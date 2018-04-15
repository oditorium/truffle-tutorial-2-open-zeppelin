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

### Adding `TutorialToken.sol` contract

### Running `truffle compile`

    root@eth1:~/TUTORIALS/2_open_zeppelin# truffle compile
    Compiling ./contracts/Migrations.sol...
    Compiling ./contracts/TutorialToken.sol...
    Compiling zeppelin-solidity/contracts/math/SafeMath.sol...
    Compiling zeppelin-solidity/contracts/token/ERC20/BasicToken.sol...
    Compiling zeppelin-solidity/contracts/token/ERC20/ERC20.sol...
    Compiling zeppelin-solidity/contracts/token/ERC20/ERC20Basic.sol...
    Compiling zeppelin-solidity/contracts/token/ERC20/StandardToken.sol...

    Compilation warnings encountered:

    zeppelin-solidity/contracts/token/ERC20/BasicToken.sol:38:5: Warning: Invoking events without "emit" prefix is deprecated.
        Transfer(msg.sender, _to, _value);
        ^-------------------------------^
    ,zeppelin-solidity/contracts/token/ERC20/StandardToken.sol:33:5: Warning: Invoking events without "emit" prefix is deprecated.
        Transfer(_from, _to, _value);
        ^--------------------------^
    ,zeppelin-solidity/contracts/token/ERC20/StandardToken.sol:49:5: Warning: Invoking events without "emit" prefix is deprecated.
        Approval(msg.sender, _spender, _value);
        ^------------------------------------^
    ,zeppelin-solidity/contracts/token/ERC20/StandardToken.sol:75:5: Warning: Invoking events without "emit" prefix is deprecated.
        Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        ^-----------------------------------------------------------^
    ,zeppelin-solidity/contracts/token/ERC20/StandardToken.sol:96:5: Warning: Invoking events without "emit" prefix is deprecated.
        Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        ^-----------------------------------------------------------^

    Writing artifacts to ./build/contracts


### Running `truffle migrate` unsuccessfully

In a separate terminal window we run `ganache-cli`

    root@eth1:~/TUTORIALS/2_open_zeppelin# ganache-cli
    Ganache CLI v6.1.0 (ganache-core: 2.1.0)

    Available Accounts
    ==================
    (0) 0x507d2a5503aef198a138e7b4c22815fd1b6bdd83
    (1) 0x3692f70bebd281f0a4fa708c0e85146b2b7debaa
    (2) 0xf08f7ff01ecafab799d5b3e30a21c965222e7dd5
    (3) 0xbfd75a2432a5ba59a74ddce0fec4e9a38cc60b6b
    ...
    Listening on localhost:8545

However, the `migrate` command can't find the running chain

    root@eth1:~/TUTORIALS/2_open_zeppelin# truffle migrate
    Could not connect to your Ethereum client. Please check that your Ethereum client:
        - is running
        - is accepting RPC connections (i.e., "--rpc" option is used in geth)
        - is accessible over the network
        - is properly configured in your Truffle configuration file (truffle.js)


### Changing `truffle.js` for `ganache-cli`

We need to change the port to `8545`


### Running `truffle migrate`

We are now running the following command

    root@eth1:~/TUTORIALS/2_open_zeppelin# truffle migrate
    Using network 'development'.

    Running migration: 1_initial_migration.js
      Deploying Migrations...
      ... 0x6cd791e73a9b062d503d16f2a935e2a27965d37ebaa45d65461fa0f8d316fc1a
      Migrations: 0x6ebe8dba17ffb2fcc618308e0b90dd72cddb68e6
    Saving successful migration to network...
      ... 0x54b733c19e550b40f321c606db7844c6a6c1f724f320d9f1514bdf681ea5ce3a
    Saving artifacts...
    Running migration: 2_deploy_contracts.js
      Deploying TutorialToken...
      ... 0x591821b4f1418dfb43f79f8dfb3c0d10fd7a5ee218439fdea7fd4a54858a0851
      TutorialToken: 0xe435eb68c9cc9fdc87e0b7da40743668759b4e6b
    Saving successful migration to network...
      ... 0xdc23372551e2c21cba0de9ffc84a8a49701f9209ce9c104188a3deb5e01fc833
    Saving artifacts...

Ganache records the following activity

    Listening on localhost:8545


    gnet_version
    eth_accounts
    eth_accounts
    net_version
    net_version
    eth_sendTransaction

      Transaction: 0x6cd791e73a9b062d503d16f2a935e2a27965d37ebaa45d65461fa0f8d316fc1a
      Contract created: 0x6ebe8dba17ffb2fcc618308e0b90dd72cddb68e6
      Gas usage: 268535
      Block Number: 1
      Block Time: Sun Apr 15 2018 07:54:42 GMT+0000 (UTC)

    eth_newBlockFilter
    eth_getFilterChanges
    eth_getTransactionReceipt
    eth_getCode
    eth_uninstallFilter
    eth_sendTransaction

      Transaction: 0x54b733c19e550b40f321c606db7844c6a6c1f724f320d9f1514bdf681ea5ce3a
      Gas usage: 41981
      Block Number: 2
      Block Time: Sun Apr 15 2018 07:54:42 GMT+0000 (UTC)

    eth_getTransactionReceipt
    eth_accounts
    net_version
    net_version
    eth_sendTransaction

      Transaction: 0x591821b4f1418dfb43f79f8dfb3c0d10fd7a5ee218439fdea7fd4a54858a0851
      Contract created: 0xe435eb68c9cc9fdc87e0b7da40743668759b4e6b
      Gas usage: 1488496
      Block Number: 3
      Block Time: Sun Apr 15 2018 07:54:42 GMT+0000 (UTC)

    eth_newBlockFilter
    eth_getFilterChanges
    eth_getTransactionReceipt
    eth_getCode
    eth_uninstallFilter
    eth_sendTransaction

      Transaction: 0xdc23372551e2c21cba0de9ffc84a8a49701f9209ce9c104188a3deb5e01fc833
      Gas usage: 26981
      Block Number: 4
      Block Time: Sun Apr 15 2018 07:54:42 GMT+0000 (UTC)

    eth_getTransactionReceipt
