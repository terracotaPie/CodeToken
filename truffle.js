module.exports = {
  networks: {
    rinkeby: {
      host: "localhost", // Connect to geth on the specified
      port: 8545,
      from: "0x5cc82734bb202eb8b9f35f399a5a1b3ebeb3bcdb", // default address to use for any transaction Truffle makes during migrations
      network_id: 4,
      gas: 4612388 // Gas limit used for deploys
    }
  }
};
