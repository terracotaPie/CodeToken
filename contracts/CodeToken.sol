pragma solidity ^0.4.19;
import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract CodeToken is MintableToken {
	string public name = 'CodeToken';
	string public symbol = 'CT';
	uint8 public decimals = 2;
	uint public INITIAL_SUPPLY = 0;
	uint256 public payoutCreator = 1000;
	uint256 public payoutVoter = 10;

	function CodeToken() public {
		balances[msg.sender] = 0;
	}

	function payout(address _creator,address[] _addresses, uint256 len) onlyOwner public returns (bool) {
		uint256 toBeMinted = len * payoutVoter + payoutCreator;
		totalSupply_ = totalSupply_.add(toBeMinted);
		balances[_creator] = balances[_creator].add(payoutCreator);
		for (uint i=0; i<len; i++) {
			balances[_addresses[i]] = balances[_addresses[i]].add(payoutVoter);
		}
		return true;
	}

}
