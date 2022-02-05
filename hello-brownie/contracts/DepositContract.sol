// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DepositContract is Ownable {

    uint256 public totalBalance;
    mapping(address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount should be positive");
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function withdraw(uint256 amount) public payable returns (uint256) {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
        totalBalance -= amount;
        return balances[msg.sender];
    }

    function getTotalBalance() public onlyOwner view returns (uint256) {
        return totalBalance;
    }

}