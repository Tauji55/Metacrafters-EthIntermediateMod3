// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(address owner_address) Ownable(owner_address) ERC20('MayanEraCoin', 'MAYA') {
        _mint(msg.sender, 200 * 10**uint(decimals()));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
    
    function decimals() public view virtual override returns(uint8){
        return 0;
    }

    function transferToken(address reciever, uint256 amount) public returns (bool){
        return transfer(reciever, amount);
    }
}