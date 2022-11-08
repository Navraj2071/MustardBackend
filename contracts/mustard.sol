// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Mustard {
    struct Fund {
        uint256 id;
        string name;
        address exAddress;
        string[] coins;
    }
    uint256 public fundCount;
    mapping(uint256 => Fund) public idToFund;

    struct User {
        address userAddress;
        string name;
        string description;
        string profilePic;
        uint256[] funds;
        uint256 investment;
    }
    mapping(address => User) public addressToUser;

    mapping(address => mapping(uint256 => uint256))
        public addressToFundIdToBalance;

    function addFund(
        uint256 _id,
        string memory _name,
        address _exAddress
    ) public {
        idToFund[_id].id = _id;
        idToFund[_id].name = _name;
        idToFund[_id].exAddress = _exAddress;
    }

    function addFundCoin(uint256 _id, string memory _coin) public {
        idToFund[_id].coins.push(_coin);
    }

    function emptyFundCoins(uint256 _id) public {
        string[] memory _coins;
        idToFund[_id].coins = _coins;
    }

    function addUser(
        string memory _name,
        string memory _description,
        string memory _profilePic
    ) public {
        addressToUser[msg.sender].userAddress = msg.sender;
        addressToUser[msg.sender].name = _name;
        addressToUser[msg.sender].description = _description;
        addressToUser[msg.sender].profilePic = _profilePic;
    }

    function invest(uint256 _fundId) public payable {
        addressToUser[msg.sender].investment =
            addressToUser[msg.sender].investment +
            msg.value;
        addressToFundIdToBalance[msg.sender][_fundId] =
            addressToFundIdToBalance[msg.sender][_fundId] +
            msg.value;
    }
}
