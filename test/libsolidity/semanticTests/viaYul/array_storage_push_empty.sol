contract C {
    uint256[] storageArray;
    function pushEmpty(uint256 len) public {
        while(storageArray.length < len)
            storageArray.push();

        for (uint i = 0; i < len; i++)
            require(storageArray[i] == 0);
    }
}
// ====
// EVMVersion: >=petersburg
// ----
// pushEmpty(uint256): 128
// gas irOptimized: 405241
// gas legacy: 416903
// gas legacyOptimized: 398664
// pushEmpty(uint256): 256
// gas irOptimized: 688701
// gas legacy: 714315
// gas legacyOptimized: 688140
// pushEmpty(uint256): 38869 -> FAILURE # out-of-gas #
// gas irOptimized: 100000000
// gas legacy: 100000000
// gas legacyOptimized: 100000000
