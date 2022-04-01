//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    // tokenId is used to give unique ids to newly minted tokens
    Counters.Counter private _tokenIds;

    // two arguments are defined in the constructor: NFT collection name, and NFT collection symbol
    constructor() ERC721("anotherNFT", "BLAH") {

    }

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();

        // _mint creates a new token
        // sets the wallet address of the person receiving the token to the recipient argument,
        // assigns the id of the new token to the newItemId argument
        _mint(recipient, newItemId);

        // here we set the data of the token of id newItemId, to the data stored in the tokenURI
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
