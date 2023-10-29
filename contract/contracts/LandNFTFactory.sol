// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./LandNFT.sol";

contract LandNFTFactory is Ownable {
    LandNFT public landNFT;

    constructor(
        string memory _name,
        string memory _symbol
    ) {
        landNFT = new LandNFT(_name, _symbol);
    }

    // Mint a variable number of land NFTs with specified properties
    function mintLands(
        address[] memory _to,
        LandNFT.Land[] memory _lands
    ) external onlyOwner {
        require(_to.length == _lands.length, "Mismatched input arrays");
        
        for (uint256 i = 0; i < _to.length; i++) {
            landNFT.mintLand(_to[i], _lands[i].name, _lands[i].location, _lands[i].area, _lands[i].price, _lands[i].image);
        }
    }
}
