contract C {
    uint256 constant LEN = 3;
    uint256[LEN] public a;

    constructor(uint256[LEN] memory _a) {
        a = _a;
    }
}

// ----
// constructor(): 1, 2, 3 ->
// gas irOptimized: 140273
// gas legacy: 183490
// gas legacyOptimized: 151938
// a(uint256): 0 -> 1
// a(uint256): 1 -> 2
// a(uint256): 2 -> 3
