pragma solidity ^0.4.19;

import "./Campaign.sol";

contract CampaignFactory
{
    address[] public campaigns;

    function createCampaign(uint16 min) public  {
        address temp = new Campaign( min, msg.sender );
        campaigns.push(temp);
    }
    
    function getDeployedCampaigns() public view returns (address[]){
        return campaigns;
    }
}
