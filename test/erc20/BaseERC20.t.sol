// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

import "forge-std/Test.sol";
import "../../src/erc20/BaseERC20.sol";

contract BaseERC20Test is Test {
    BaseERC20 public token;

    address initialOwner = address(1);
    string tokenName = "Test Token";
    string tokenSymbol = "TST";
    uint256 initialSupply = 69 ether;

    function setUp() public {
        token = new BaseERC20(
            initialOwner,
            tokenName,
            tokenSymbol,
            initialSupply
        );
    }

    function testMintTotalSupplyToInitialOwner() public {
        assertEq(token.balanceOf(initialOwner), initialSupply);
        assertEq(token.totalSupply(), initialSupply);
    }
}
