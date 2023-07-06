// SampleSBT.sol
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//Remixの場合、npmを使ってパッケージをインストールすることはできない。そのため、GitHubのURLを直接指定してインポートする。
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/token/ERC1155/ERC1155.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/access/Ownable.sol";

contract SampleSBT is ERC1155, Ownable {

    // コントラクトデプロイ時に１度だけ呼ばれる
    constructor() ERC1155("https://taki-kazuhiro.github.io/githubpages-sample/data{id}.json") {

    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address to, uint256 id, uint256 amount) public onlyOwner { 
        _mint(to, id, amount, "");
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts) public onlyOwner { 
        _mintBatch(to, ids, amounts, "");
    }

    // _beforeTokenTransferをオーバーライドして、譲渡を禁止する。
    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal override {
        
        // 新規発行以外のトークン移動を禁止する。
        // 新規発行時にはfromアドレスはゼロアドレスになるため、それ以外はトークンの譲渡と見なす。
        require(from == address(0), "token transfers are disabled");

        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }

}