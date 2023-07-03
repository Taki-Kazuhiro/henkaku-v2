require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const { API_URL_SEPOLIA, PRIVATE_KEY, API_KEY_SEPOLIA } = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      //sepolia networksへのURL
      url: API_URL_SEPOLIA,
      //自分のウォレットの秘密鍵
      accounts: [PRIVATE_KEY]
    }
  },
  etherscan: {
    //etherscanで作成したAPIキー
    apiKey: process.env.API_KEY_SEPOLIA
  }
};