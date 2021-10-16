// contracts/Pledge.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Pledge {
    mapping(address => bool) public pledges;
    mapping(address => uint256) public rates;

    function pledge(uint256 _rate) public {
        require(_rate>0, "Pledged rate has to be more than 0.");
        require(!pledges[msg.sender], "Pledger is already pledged.");
        pledges[msg.sender] = true;
        rates[msg.sender] = _rate;
    }

    function isPledged(address _polluter) external view returns (bool) {
        return pledges[_polluter]; //all values of a mapping are initialized with false
    }
}