pragma solidity ^0.4.19;

contract Campaign
{
    struct Request{
        string Description;
        uint16 value;
        address vendor;
        uint16 totalApprovals;
        bool completed;
        mapping(address => bool) approvers;
    }

    address manager;
    uint16 public minimumContribution;
    string public Description;
    //spend requests
    Request[] spendRequests;
    
    address[] contributers;
    uint16 public totalContributers;
    
    function Campaign(uint16 minimum, address creator) public {
        minimumContribution = minimum;
        manager = creator;
    }
    
    modifier isOwner() {
        require(msg.sender == manager);
        _;
    }

    function createRequest(address reciepent, string desc, uint16 amount) public isOwner {
        Request memory req = Request({
            Description: desc,
            vendor: reciepent,
            value: amount,
            completed: false,
            totalApprovals: 0
        });
        spendRequests.push(req);
    }

    function approveRequest(uint16 index) public {
        Request storage request = spendRequests[index];
        require(!request.approvers[msg.sender]);
        
        request.approvers[msg.sender] = true;
        request.totalApprovals ++;
    }

    function finalizeRequest(uint16 index) public isOwner {
        Request storage request = spendRequests[index];
        require(!request.completed);
        require(request.totalApprovals > totalContributers / 2);
        
        request.completed = true;
        request.vendor.transfer(request.value);
    }
    
    function getContributorCount() public isOwner view returns (uint16) {
        return totalContributers;
    }
}