pragma solidity^ 0.4.19;

contract CampaignFactory
{
    address[] public campaigns;

    function createCampaign(string desc, uint16 min) public returns (address) {
        Campaign temp = new Campaign(min, desc, msg.sender);
        campaigns.push(temp);
    }
}

contract Campaign
{
    struct Request{
        string Description;
        uint16 value;
        address vendor;
        uint16 totalApprovals;
        mapping(address => bool) approvars;
    }

    address[] contributers;
    address manager;
    uint16 public minimumContribution;
    function Campaign(uint16 minimum, string desc, address creator) public {
        minimumContribution = minimum;
        manager = creator;
    }

    function createRequest() public {

    }

    function approveRequest() public {

    }

    function finalizeRequest() public {

    }
}