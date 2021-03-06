pragma solidity ^0.8.7;

import "../app/node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

// StarNotary Contract declaration inheritance the ERC721 openzeppelin implementation
contract StarNotary is ERC721 {

    // Star data
    struct Star {
        string name;
    }

    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_){

    }
    
    // mapping the Star with the Owner Address
    mapping(uint256 => Star) public tokenIdToStarInfo;
    // mapping the TokenId and price
    mapping(uint256 => uint256) public starsForSale;

    
    // Create Star using the Struct
    function createStar(string memory _name, uint256 _tokenId) public { // Passing the name and tokenId as a parameters
        Star memory newStar = Star(_name); // Star is an struct so we are creating a new Star
        tokenIdToStarInfo[_tokenId] = newStar; // Creating in memory the Star -> tokenId mapping
        _mint(msg.sender, _tokenId); // _mint assign the the star with _tokenId to the sender address (ownership)
    }

    // Putting an Star for sale (Adding the star tokenid into the mapping starsForSale, first verify that the sender is the owner)
    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "You can't sale the Star you don't owned");
        starsForSale[_tokenId] = _price;
    }


    // Function that allows you to convert an address into a payable address
    function _make_payable(address x) internal pure returns (address payable) {
        return payable(x);
    }

    function buyStar(uint256 _tokenId) public  payable {
        require(starsForSale[_tokenId] > 0, "The Star should be up for sale");
        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);
        require(msg.value > starCost, "You need to have enough Ether");
        safeTransferFrom(ownerAddress, msg.sender, _tokenId); // We can't use _addTokenTo or_removeTokenFrom functions, now we have to use safeTransferFrom
        address payable ownerAddressPayable = _make_payable(ownerAddress); // We need to make payable to be able to use transfer() function to transfer ethers
        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            address payable payableSender = _make_payable(msg.sender);
            payableSender.transfer(msg.value - starCost);
        }
    }

    function lookUptokenIdToStarInfo (uint _tokenId) public view returns (string memory) {
        //Returns the name of the star with the tokenId.
        Star memory tempStar = tokenIdToStarInfo[_tokenId];
        return tempStar.name;
    }

    function exchangeStars(uint256 _tokenId1, uint256 _tokenId2) public {
        //Exchange stars between two owners, provided the sender is one of the owners of the two tokens.
        address token1Owner = ownerOf(_tokenId1);
        address token2Owner = ownerOf(_tokenId2);
        if (token1Owner == msg.sender || token2Owner == msg.sender){
            safeTransferFrom(token1Owner, token2Owner, _tokenId1);
            safeTransferFrom(token2Owner, token1Owner, _tokenId2);
        }
    }

    function transferStar(address _to1, uint256 _tokenId) public {
        //Check if the sender is the ownerOf(_tokenId)
        //Use the safeTransferFrom(from, to, tokenId); function to transfer the Star
        if (ownerOf(_tokenId) == msg.sender){
            safeTransferFrom(msg.sender, _to1, _tokenId);
        }
    }

}