// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

import "forge-std/Test.sol";
import "../../src/erc20/BaseERC20Factory.sol";

contract BaseERC20FactoryTest is Test {
    BaseERC20Factory public factory;
    BaseERC20 public token;

    address initialOwner = address(1);
    string tokenName = "Test Token";
    string tokenSymbol = "TST";
    uint256 initialSupply = 69 ether;

    function setUp() public {
        factory = new BaseERC20Factory();
    }

    function testCreatesBaseERC20Token() public {
        address _token = factory.create(
            tokenName,
            tokenSymbol,
            initialSupply,
            initialOwner
        );

        token = BaseERC20(_token);

        assertEq(token.balanceOf(initialOwner), initialSupply);
        assertEq(token.totalSupply(), initialSupply);
    }
}
