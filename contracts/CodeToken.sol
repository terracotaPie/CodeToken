pragma solidity ^0.4.8;
import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract CodeToken is MintableToken {
	string public name = 'CodeToken';
	string public symbol = 'CT';
	uint8 public decimals = 2;
	uint public INITIAL_SUPPLY = 0;
	uint256 public payoutCreator = 1000;
	uint256 public payoutVoter = 10;
	uint256 public durationCost = 5;
	uint256 public currentPromotedContentId = 0;
  mapping(uint256 => string) promotedContent;

	function CodeToken() public {
		balances[msg.sender] = 0;
	}

	function addPromotedContent(string description, uint256 duration) public returns (bool) {
		if(transferFrom(msg.sender, 0x0000000000000000000000000000000000000000, duration * durationCost)) {
			promotedContent[currentPromotedContentId] = description;
			currentPromotedContentId = currentPromotedContentId.add(1);
		} else {
			return false;
		}
		return true;
	}

	function payout(address _creator, address[] _addresses, uint256 len) onlyOwner public returns (bool) {
		uint256 toBeMinted = len * payoutVoter + payoutCreator;
		totalSupply_ = totalSupply_.add(toBeMinted);
		balances[_creator] = balances[_creator].add(payoutCreator);
		for (uint i=0; i<len; i++) {
			balances[_addresses[i]] = balances[_addresses[i]].add(payoutVoter);
		}
		return true;
	}
}
