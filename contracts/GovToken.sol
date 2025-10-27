// contracts/GovToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GovToken {
    string public name = "GovToken";
    string public symbol = "GOV";
    uint8  public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function mint(address to, uint256 val) external {
        balanceOf[to] += val;
        totalSupply += val;
        emit Transfer(address(0), to, val);
    }

    function transfer(address to, uint256 val) external returns (bool) {
        require(balanceOf[msg.sender] >= val, "insufficient");
        unchecked {
            balanceOf[msg.sender] -= val;
            balanceOf[to] += val;
        }
        emit Transfer(msg.sender, to, val);
        return true;
    }
}
