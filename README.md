# 概要
## コントラクトファイル
### HenkakuToken.sol
ホワイトリスト型のERC20のFTモック。

### SushiItems.sol
ERC1155のSFTモック。

### SampleSBT.sol
ERC1155のSBTモック。

## デプロイ
➀デプロイするコントラクト選択
whitelist-contract-sample\scripts\deploy.tsのコントラクト取得処理をデプロイしたいコントラクトに書き換える
>const Contract = await ethers.getContractFactory("コントラクトファイル名");

➁デプロイ
whitelist-contract-sampleフォルダ直下で以下実行するこ
npx hardhat run --network (デプロイしたいネットワーク) scripts/deploy.ts

③デプロイ検証
whitelist-contract-sampleフォルダ直下で以下実行
npx hardhat verify --network shibuya (デプロイしたスマコンアドレス)
