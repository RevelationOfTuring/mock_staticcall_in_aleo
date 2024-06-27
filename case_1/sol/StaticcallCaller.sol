// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IStaticcallTarget} from "./interfaces/IStaticcallTarget.sol";

contract StaticcallCaller {
    IStaticcallTarget private _staticcallTarget;
    mapping(address => uint) public map;

    constructor(address staticallTargetAddr) {
        _staticcallTarget = IStaticcallTarget(staticallTargetAddr);
    }

    function setProduct(address key) external {
        map[key] = _staticcallTarget.getProductFromMap(key);
    }
}
