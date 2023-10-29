// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LandNFT is ERC721, Ownable {
    struct Land {
        string name;
        string location;
        uint256 area;
        uint256 price;
        string image;
    }
    
    mapping(uint256 => Land) public landProperties;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {}

    // Mint a land NFT with specified properties
    function mintLand(
        address _to,
        string memory _name,
        string memory _location,
        uint256 _area,
        uint256 _price,
        string memory _image
    ) external {
        uint256 tokenId = totalSupply();
        _mint(_to, tokenId);
        landProperties[tokenId] = Land({
            name: _name,
            location: _location,
            area: _area,
            price: _price,
            image: _image
        });
    }

    // Update the price of a land NFT
    function updateLandPrice(uint256 _tokenId, uint256 _newPrice) external onlyOwner {
        require(_exists(_tokenId), "Land NFT does not exist");
        landProperties[_tokenId].price = _newPrice;
    }

    // Transfer a land NFT to another address
    function transferLand(address _to, uint256 _tokenId) external {
        require(_isApprovedOrOwner(_msgSender(), _tokenId), "Not the owner or approved");
        safeTransferFrom(_msgSender(), _to, _tokenId);
    }

    // Get the details of a land NFT
    function getLandDetails(uint256 _tokenId) external view returns (Land memory) {
        require(_exists(_tokenId), "Land NFT does not exist");
        return landProperties[_tokenId];
    }
}
