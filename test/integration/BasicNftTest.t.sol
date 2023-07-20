// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft deployer;
    BasicNft basicNft;

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory actualName = basicNft.name();
        string memory expectedName = "Dogie";

        bytes32 hashed_actualName = keccak256(abi.encodePacked(actualName));
        bytes32 hashed_expectedName = keccak256(abi.encodePacked(expectedName));

        assert(hashed_actualName == hashed_expectedName);
    }
}
