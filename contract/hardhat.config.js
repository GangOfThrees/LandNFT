require("@nomicfoundation/hardhat-toolbox");

const dotenv = require("dotenv");

dotenv.config();

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

// chain urls
const LOCAL_EVMC_URL = process.env.LOCAL_EVMC_URL || 'http://127.0.0.1:8545';

const MAIN_EVMC_URL = 'https://testnet.bitfinity.network';

const config = {
  solidity: {
    version: '0.8.20',
    settings: {
      optimizer: {
        runs: 200,
        enabled: true,
      },
    },
  },
  defaultNetwork: 'evmc',
  networks: {
    localhost: {
      url: LOCAL_EVMC_URL,
      accounts: [
        ...(process.env.DEPLOYER_SECRET ? [process.env.DEPLOYER_SECRET] : []),
      ],
    },
    evmc: {
      url: MAIN_EVMC_URL,
      accounts: [
        ...(process.env.DEPLOYER_SECRET ? [process.env.DEPLOYER_SECRET] : []),
      ],
    },

  },
};

module.exports = config