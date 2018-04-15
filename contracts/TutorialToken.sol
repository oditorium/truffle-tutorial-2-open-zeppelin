pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

/// @title Tutorial Token
/// @dev implements a token contract deriving from StandardToken
contract TutorialToken is StandardToken {


    string public name = 'TutorialToken';
    string public symbol = 'TT';
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLY = 12000;

    /// @dev the constructor sets the total token supply and assigned all tokens to the creator
    function TutorialToken() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }

}
