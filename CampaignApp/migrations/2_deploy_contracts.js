var Campaign = artifacts.require("./contracts/Campaign.sol");
var CampaignFactory = artifacts.require("./contracts/CampaignFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(CampaignFactory);
  deployer.deploy(Campaign, 100, 0x100000);
  deployer.link(Campaign, CampaignFactory);
};
