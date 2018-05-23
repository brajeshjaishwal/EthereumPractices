var Campaign = artifacts.require("./Campaign.sol");

export default function (deployer) {
  deployer.deploy(Campaign);
  //deployer.link(ConvertLib, MetaCoin);
  //deployer.deploy(MetaCoin);
}
