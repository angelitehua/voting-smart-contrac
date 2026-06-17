// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Vote {
    // Proposal structure: holds the name and the vote count
    struct Proposal {
        string name;
        uint256 numberOfVotes;
    }

    // Public array that stores all proposals
    Proposal[] public listOfProposals;

    // Mapping to track which addresses have already voted
    mapping(address => bool) public hasVoted;

    // Address of the contract owner (whoever deploys it)
    address public owner;

    // Event emitted every time someone votes
    event Voted(address indexed voter, uint256 proposalIndex);

    // Constructor: creates the initial proposals from a list of names
    constructor(string[] memory names) {
        owner = msg.sender;

        for (uint256 i = 0; i < names.length; i++) {
            listOfProposals.push(Proposal({
                name: names[i],
                numberOfVotes: 0
            }));
        }
    }

    // Cast a vote for the proposal at the given index
    function vote(uint256 index) public {
        // Checks: validate before changing any state
        require(!hasVoted[msg.sender], "You already voted");
        require(index < listOfProposals.length, "Proposal does not exist");

        // Effects: update the state
        listOfProposals[index].numberOfVotes += 1;
        hasVoted[msg.sender] = true;

        // Announce the vote to the outside world
        emit Voted(msg.sender, index);
    }

    // Returns the index of the proposal with the most votes
    function winningProposal() public view returns (uint256 winnerIndex) {
        uint256 maxVotes = 0;
        for (uint256 i = 0; i < listOfProposals.length; i++) {
            if (listOfProposals[i].numberOfVotes > maxVotes) {
                maxVotes = listOfProposals[i].numberOfVotes;
                winnerIndex = i;
            }
        }
    }
}
