require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      //Alchemyで作成したsepolia networksへのURL
      url: process.env.API_URL_SEPOLIA,
      //自分のウォレットの秘密鍵
      accounts: [process.env.PRIVATE_KEY]
    },
    shibuya: {
      //shibuya networksへのURL
      url:"https://evm.shibuya.astar.network",
      chainId:81,
      //自分のウォレットの秘密鍵
      accounts:[process.env.PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: {
      //etherscanで作成したAPIキー
      sepolia: process.env.API_KEY_SEPOLIA,
      //https://blockscout.com/shibuya/　で作成したAPIキー
      shibuya: process.env.API_KEY_SHIBUYA
    },
    //shibuyaはhardhatのデフォルトサポートに含まれていないため、新しくサポート対象として追加 (https://hardhat.org/hardhat-runner/plugins/nomicfoundation-hardhat-verify#adding-support-for-other-networks)
    customChains: [
      {
        network: "shibuya",
        chainId: 81,
        urls: {
          apiURL: "https://blockscout.com/shibuya/api",
          browserURL: "https://blockscout.com/shibuya"
        }
      }
    ]
  }
};