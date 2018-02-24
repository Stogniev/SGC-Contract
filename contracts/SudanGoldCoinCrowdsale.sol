pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './token/CappedAndBurnableToken.sol';
import './crowdsale/Crowdsale.sol';
import './SudanGoldCoinToken.sol';

/**
 * The SudanGoldCoinCrowdsale contract represents rules of crowdsale
 */
contract SudanGoldCoinCrowdsale is Crowdsale, Ownable {

    function SudanGoldCoinCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet) public
    Crowdsale(_startTime, _endTime, _rate, _wallet) {

    }

    // creates the token to be sold.
    function createTokenContract() internal returns (CappedAndBurnableToken) {
        return new SudanGoldCoinToken();
    }

    function sendTokens(address _to, uint256 _amount) onlyOwner public returns (bool) {
        require(!hasEnded());
        return token.mint(_to, _amount);
    }

    function setRate(uint256 _rate) onlyOwner public returns (bool) {
        rate = _rate;
        return true;
    }

    function setEndTime(uint256 _endTime) onlyOwner public returns (bool) {
        endTime = _endTime;
        return true;
    }
}
