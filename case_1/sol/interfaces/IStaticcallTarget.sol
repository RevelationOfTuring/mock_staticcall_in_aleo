// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IStaticcallTarget {
    function getProductFromMap(address key) external view returns (uint);
}
