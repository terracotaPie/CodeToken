pragma solidity ^0.4.19;
import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract CodeToken is MintableToken {
	string public name = 'CodeToken';
	string public symbol = 'CT';
	uint8 public decimals = 0;
	uint public INITIAL_SUPPLY = 0;

	function CodeToken() public {
		balances[msg.sender] = 0;
	}

}
