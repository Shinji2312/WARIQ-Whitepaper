// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

contract WariqSovereignToken {
    string public name = "Wariq Coin";
    string public symbol = "WRQ";
    uint256 public totalSupply = 1300000000000 * 10**18; // 1.3T Potential

    mapping(address => uint256) public balances;
    uint256 public maunFundRate = 9; // 9% Ma'un Fund for Node 8

    // Enforce Mizan Protection
    function transfer(address to, uint256 amount) public returns (bool) {
        uint256 maunAmount = (amount * maunFundRate) / 100;
        uint256 netAmount = amount - maunAmount;
        
        balances[msg.sender] -= amount;
        balances[to] += netAmount;
        // The 9% Ma'un amount is diverted to the Sovereign Gateway
        return true;
    }
}
