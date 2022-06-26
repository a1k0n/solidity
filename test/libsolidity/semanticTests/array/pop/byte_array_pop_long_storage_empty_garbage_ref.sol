contract c {
    uint256 a;
    uint256 b;
    bytes data;
    function test() public {
        for (uint8 i = 0; i <= 40; i++)
            data.push(0x03);
        for (uint8 j = 0; j <= 40; j++) {
            assembly {
                mstore(0, "garbage")
            }
            data.pop();
        }
    }
}
// ----
// test() ->
// gas irOptimized: 141542
// gas legacy: 164430
// gas legacyOptimized: 158432
// storageEmpty -> 1
