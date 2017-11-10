pragma solidity ^0.4.11;
// Specify compiler version


contract Voting {
    // Mapping below is equivalent to associative array or hash
    // Key is candidate name stored as type bytes32 
    // Value is unsigned int to store vote count

    mapping (bytes32 => uint8) public votesReceived;

    // Solidity doesn't let you pass in an array of strings in the constructor
    // Use an array of bytes32 instead

    bytes32[] public candidateList;

    // Constructor which will be called once contract is dceployed on the blockchain

    function Voting(bytes32[] candidateNames) public {
        candidateList = candidateNames;
    }

    // Returns total cotes a candidate has received so far

    function totalVotesFor(bytes32 candidate) public view returns (uint8) {
        if (validCandidate(candidate) == false) 
            revert();
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) public {
       if (validCandidate(candidate) == false) 
            revert();
       votesReceived[candidate] += 1; 
    }

    function validCandidate(bytes32 candidate) public view returns (bool) {
         for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}