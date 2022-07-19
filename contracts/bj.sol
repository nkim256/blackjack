// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BlackJack {
    // need an entry fee and a pot
    // deal with softhands
    uint256[52] public deck;
    uint256 index = 0;

    //stack overflow
    function shuffle() public {
        for (uint256 i = 0; i < deck.length; i++) {
            uint256 n = i +
                (uint256(keccak256(abi.encodePacked(block.timestamp))) %
                    (deck.length - i));
            uint256 temp = deck[n];
            deck[n] = deck[i];
            deck[i] = temp;
        }
    }

    function make_deck() public {
        for (uint256 i = 0; i < 52; i++) {
            deck[i] = i + 1;
        }
        shuffle();
    }

    function retrieve() public view returns (uint256[52] memory) {
        return deck;
    }

    function deal() public returns (uint256) {
        uint256 ret = deck[index];
        index++;
        return ret;
    }
}
