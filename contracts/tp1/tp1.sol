// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Tp1 {

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Liste des ids des candidats
    uint[] public candidateIdsList;

    // Liste des candidats
    mapping (uint id => Candidate Candidate) public candidateList;

    // Liste des votant avec leur vote
    mapping (address addr => bool ) public voterList;

    // Récupérer l'adresse de l'owner
    address public owner;

    // Enregistrement des candidats
    function registerCandidate(string memory name) public {
        uint candidateId = candidateIdsList.length;
        candidateList[candidateId] = Candidate(candidateId, name, 0);
        candidateIdsList.push(candidateId);
    }

    // Système de vote
    function voting(uint candidateId, bool value) public {
        if (value) {
            candidateList[candidateId].voteCount++;
        } else {
            candidateList[candidateId].voteCount--;
        }
        voterList[msg.sender] = value;
    }

    // Récupération du nombre de vote pour un candidat
    function getCandidateVoteCount(uint candidateId) public view returns (uint) {
        return (candidateList[candidateId].voteCount);
    }

    // Récupération de la liste des candidats
    /*function getAllCandidates() public view returns(address[] memory) {
        address[] memory ret = new address[]();
        for (uint i = 0; i < candidateList.length; i++) {
            ret[i] = candidateList[i];
        }
        return ret;
    }*/
}