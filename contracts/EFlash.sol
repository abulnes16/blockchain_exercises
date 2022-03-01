//SPDX-License-Identifier: MIT
pragma solidity 0.8.12;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract EFlashToken is ERC20, Ownable {

    uint256 MAX_TOKEN_SUPPLY = 1000;
    string private _tk_name;
    string private _tk_symbol;


    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_){
        _tk_name = name_;
        _tk_symbol = symbol_;
    }

    function setName(string memory newName) public onlyOwner {
        _tk_name = newName;
    } 

    function setSymbol(string memory newSymbol) public onlyOwner {
        _tk_symbol = newSymbol;
    }

    function name() public view virtual override returns (string memory){
        return _tk_name;
    }

    function symbol() public view virtual override returns (string memory){
        return _tk_symbol;
    }

    function mint(address account, uint256 amount) public {
        uint256 currentSupply = totalSupply();
        require(currentSupply < MAX_TOKEN_SUPPLY);
        _mint(account, amount);
        
    }
}
