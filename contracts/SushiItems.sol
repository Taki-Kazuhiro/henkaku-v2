// SushiItems.sol
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract SushiItems is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenCounter;

    // コントラクトデプロイ時に１度だけ呼ばれる
    constructor() ERC1155("https://taki-kazuhiro.github.io/githubpages-sample/data{id}.json") {

	    // tokenID 0 を 100個 発行する。　
	    // デフォルトの所有者は msg.sender (コントラクトをデプロイした人）
        _mint(msg.sender, 0, 100, "");
        _mint(msg.sender, 1, 10**9, "");
    }

    function mint(uint256 _tokenId, uint256 _amount) public { 
        _mint(msg.sender, _tokenId, _amount, "");
    }

    function mintBatch(uint256[] memory _tokenIds, uint256[] memory _amounts) public { 
        _mintBatch(msg.sender, _tokenIds, _amounts, "");
    }

}