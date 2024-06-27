// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IStaticcallTarget} from "./interfaces/IStaticcallTarget.sol";

contract StaticcallTarget is IStaticcallTarget {
    mapping(address => uint) public map;

    function setMap(address key, uint value) external {
        map[key] = value;
    }

    function getProductFromMap(address key) external view returns (uint) {
        uint value = map[key];
        return value * (value + 1) * (value + 2);
    }
}
