//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract myepicNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("ADORECOLLECTION", "ADORE") {
        console.log("This is my first NFT contract, I'm so excited!");
    }

    string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";
    string[] firstWords = ["Police", "Camel", "String", "Telephone", "Lord", "Duke", "Sands", "Elevator", "Sandals", "Door", "Raise", "Cloak", "Dagger", "Crowd", "Canoe", "Camel"];
    string[] secondWords = ["Wear", "Dope", "Dance", "Sing", "Jump", "Close", "Bathe", "Sweep", "Clean", "Sick", "Proud", "Canned", "Plan", "Rain", "Stab", "Wear"];
    string[] thirdWords = ["Shawarma", "Fries", "Coleslaw", "Yoghurt", "Rice", "Spaghetti", "Steak", "Suya", "Kebab", "Chicken", "Raisin", "Gizdodo", "Avocado"];

    function pickRandomFirstWord(uint tokenId) public view returns(string memory) {
        uint rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));
        rand = rand % firstWords.length;
        return firstWords[rand];
    }

    function pickRandomSecondWord(uint tokenId) public view returns(string memory) {
        uint rand = random(string(abi.encodePacked("SECOND_WORD", Strings.toString(tokenId))));
        rand = rand % secondWords.length;
        return secondWords[rand];
    }

    function pickRandomThirdWord (uint tokenId) public view returns(string memory) {
        uint rand = random(string(abi.encodePacked("THIRD_WORD", String.toString(tokenId))));
        rand = rand % thirdWords.length;
        return thirdWords[rand];
    }

    function random(string memory input) internal pure returns(uint) {
        return uint256(keccak256(abi.encodePacked(input)));
    }


    function makeAnEpicNFT () public {
         uint256 newItemId = _tokenIds.current();
         string memory first = pickRandomFirstWord(newItemId);
         string memory second = pickRandomSecondWord(newItemId);
         string memory third = pickRandomThirdWord(newItemId);

         string memory finalSvg = string abi.encodePacked(baseSvg, first, second, third, "</text><svg>");
         console.log("\n-----------------");
         console.log(finalSvg);
         console.log("---------------------------\n");

         _safeMint(msg.sender, newItemId);
         _setTokenURI(newItemId, "data:application/json;base64,eyJuYW1lIjoiT3Jlb2x1d2EgQWtpbm9sYSIsCiJkZXNjcmlwdGlvbiI6IkEgbWVtYmVyIG9mIGEgaGlnaCB2YWx1ZSBjb2xsZWN0aW9uIiwKImltYWdlIjoiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUhCMWNuQnNaVHNnWm05dWRDMW1ZVzFwYkhrNklHNXZkRzhnYzJGdWN6c2dabTl1ZEMxemFYcGxPaUF4TkhCNE95QjlQQzl6ZEhsc1pUNEtJQ0FnSUR4eVpXTjBJSGRwWkhSb1BTSXhNREFsSWlCb1pXbG5hSFE5SWpFd01DVWlJR1pwYkd3OUltSnNZV05ySWlBdlBnb2dJQ0FnUEhSbGVIUWdlRDBpTlRBbElpQjVQU0kxTUNVaUlHTnNZWE56UFNKaVlYTmxJaUJrYjIxcGJtRnVkQzFpWVhObGJHbHVaVDBpYldsa1pHeGxJaUIwWlhoMExXRnVZMmh2Y2owaWJXbGtaR3hsSWo1UGNtVnZiSFYzWVNCQmEybHViMnhoUEM5MFpYaDBQZ284TDNOMlp6ND0ifQo=");
         console.log("An NFT with/ ID %s has been minted to %s. Whoa",newItemId, msg.sender);
         _tokenIds.increment();
    }
}