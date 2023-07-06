// SushiItems.sol
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
//Remixの場合、npmを使ってパッケージをインストールすることはできない。そのため、GitHubのURLを直接指定してインポートする。
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/token/ERC1155/ERC1155.sol";

contract SushiItems is ERC1155 {

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