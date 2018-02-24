pragma solidity ^0.4.18;

import './BurnableToken.sol';
import './CappedToken.sol';

/*
* Combination of CappedToken + BurnableToken
*/
contract CappedAndBurnableToken is CappedToken, BurnableToken {

    function CappedAndBurnableToken(uint256 _cap) public CappedToken(_cap) {

    }

}