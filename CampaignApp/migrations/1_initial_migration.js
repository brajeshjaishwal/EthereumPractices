var Migrations = artifacts.require("./contracts/Migrations.Sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
