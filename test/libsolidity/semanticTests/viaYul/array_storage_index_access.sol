contract C {
    uint[] storageArray;
    function test_indices(uint256 len) public
    {
        while (storageArray.length < len)
            storageArray.push();
        while (storageArray.length > len)
            storageArray.pop();
        for (uint i = 0; i < len; i++)
            storageArray[i] = i + 1;

        for (uint i = 0; i < len; i++)
            require(storageArray[i] == i + 1);
    }
}
// ----
// test_indices(uint256): 1 ->
// test_indices(uint256): 129 ->
// gas irOptimized: 3016341
// gas legacy: 3070431
// gas legacyOptimized: 3011099
// test_indices(uint256): 5 ->
// gas irOptimized: 370965
// gas legacy: 369211
// gas legacyOptimized: 366119
// test_indices(uint256): 10 ->
// test_indices(uint256): 15 ->
// gas irOptimized: 72860
// test_indices(uint256): 0xFF ->
// gas irOptimized: 3405725
// gas legacy: 3512637
// gas legacyOptimized: 3396577
// test_indices(uint256): 1000 ->
// gas irOptimized: 18189622
// gas legacy: 18611999
// gas legacyOptimized: 18172944
// test_indices(uint256): 129 ->
// gas irOptimized: 2744925
// gas legacy: 2771961
// gas legacyOptimized: 2715773
// test_indices(uint256): 128 ->
// gas irOptimized: 410325
// gas legacy: 466504
// gas legacyOptimized: 417656
// test_indices(uint256): 1 ->
// gas irOptimized: 367005
// gas legacy: 363401
// gas legacyOptimized: 361805
