// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IStaticcallTarget} from "./interfaces/IStaticcallTarget.sol";

contract StaticcallTarget is IStaticcallTarget {
    mapping(address => uint) public map;

    function setMap(address key, uint value) external {
        map[key] = value;
    }

    function getFactorialFromMap(address key) external view returns (uint) {
        uint value = map[key];
        if (value == 0) {
            return 1;
        }

        uint factorial = 1;
        for (uint i = 2; i <= value; ++i) {
            factorial *= i;
        }

        return factorial;
    }
}
