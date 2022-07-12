// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract GovernanceToken is ERC20Votes {
    uint public s_maxSupply = 1000000000000000000000000;

    constructor() ERC20("GovernanceToken","GT") 
    /* for capable voting by governane token */
    ERC20Permit("GovernanceToken") 
    {
        _mint(msg.sender, s_maxSupply);
    }

    // Below are overrides required by solidity to update the snapshot of the check points

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal override(ERC20Votes) {
        super._burn(account, amount);
    }

}
