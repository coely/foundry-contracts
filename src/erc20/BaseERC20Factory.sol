// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "./BaseERC20.sol";

/**
 * @title BaseERC20Factory
 *
 * @notice The BaseERC20Factory is a simple token factory that deploys
 * an ERC20 token based on an OpenZeppelin implementation.
 */
contract BaseERC20Factory {
    event TokenCreated(
        address indexed token,
        address initialOwner,
        string name,
        string symbol,
        uint256 initialSupply
    );

    function create(
        string calldata name,
        string calldata symbol,
        uint256 initialSupply,
        address initialOwner
    ) external returns (address) {
        require(bytes(name).length > 0, "Name is empty");
        require(bytes(symbol).length > 0, "Symbol is empty");

        require(initialSupply > 0, "Low supply");
        require(initialOwner != address(0), "Invalid owner");

        ERC20 baseERC20 = new BaseERC20(
            initialOwner,
            name,
            symbol,
            initialSupply
        );

        emit TokenCreated(
            address(baseERC20),
            initialOwner,
            name,
            symbol,
            initialSupply
        );

        return address(baseERC20);
    }
}
