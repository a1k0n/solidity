contract c {
    bytes data;

    function test() public returns (bytes memory) {
        for (uint256 i = 0; i < 33; i++) data.push(0x03);
        for (uint256 j = 0; j < 4; j++) data.pop();
        return data;
    }
}

// ----
// test() -> 0x20, 29, 0x0303030303030303030303030303030303030303030303030303030303000000
// gas irOptimized: 108986
// gas legacy: 126728
// gas legacyOptimized: 123541
