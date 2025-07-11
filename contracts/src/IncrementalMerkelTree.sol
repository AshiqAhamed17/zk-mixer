// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

contract IncrementalMerkelTree {
    uint32 public immutable i_depth;
    bytes32 public s_root;



    error IncrementalMerkelTree_DepthShouldBeGreaterThanZero();
    error IncrementalMerkelTree_DepthShouldBeLessThan32();

    constructor(uint32 _depth) {
        if( i_depth == 0 ) {
            revert IncrementalMerkelTree_DepthShouldBeGreaterThanZero();
        }
        if( _depth > 32) {
            revert IncrementalMerkelTree_DepthShouldBeLessThan32();
        }
        i_depth = _depth;
    }
}