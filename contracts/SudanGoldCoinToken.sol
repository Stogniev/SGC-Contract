pragma solidity ^0.4.18;

import './token/CappedAndBurnableToken.sol';

contract SudanGoldCoinToken is CappedAndBurnableToken {
    string public constant name = 'Sudan Gold Coin';
    string public constant symbol = 'SGC';
    uint8 public constant decimals = 18;
    uint256 public constant maxSupply = 20000000 * 10 ** 18;

    function SudanGoldCoinToken() public CappedAndBurnableToken(maxSupply) {

    }

}
