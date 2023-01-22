//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

// import neccesary libaries

import "@openzeppelin/contracts/utils/Counters.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";



// call the defix contract

contract DefixEstate is ERC721URIStorage {

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;


    // call the constructor that can be executed once 

    constructor() ERC721("Defix Estate", "DEFIX") {}


  // call the mint function of the token id

    function mint(string memory tokenURI) public returns (uint256) {

        _tokenIds.increment();
    

        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);

        _setTokenURI(newItemId, tokenURI);

        return newItemId;

    }


    // lets declare the function to check the totalsupply of the contract

    function totalSupply() public view returns (uint256) {
        
        return _tokenIds.current();
    }
}