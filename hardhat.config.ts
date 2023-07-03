require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      //sepolia networksへのURL
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
    //etherscanで作成したAPIキー
    apiKey: process.env.API_KEY_SEPOLIA
  }
};