require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const { API_URL_SEPOLIA, PRIVATE_KEY, API_KEY_SEPOLIA } = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      url: API_URL_SEPOLIA,
      accounts: [PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: process.env.API_KEY_SEPOLIA
  }
};