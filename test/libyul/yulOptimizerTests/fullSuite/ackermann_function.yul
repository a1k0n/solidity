// https://en.wikipedia.org/wiki/Ackermann_function
// Test to see how FunctionSpecializer deals with functions that are too recursive / resource intensive.
{
    // 5
    sstore(0, A(2, 1))
    // 7
    sstore(1, A(2, 2))

    // Too many unrolling needed. In arbitrary precision, the value is 2**65536 - 3.
    sstore(2, A(4, 2))

    function A(m, n) -> ret {
        switch m
        case 0 { ret := add(n, 1) }
        default {
            switch n
            case 0 { ret := A(sub(m, 1), 1) }
            default { ret := A(sub(m, 1), A(m, sub(n, 1))) }
        }
    }
}
// ----
// step: fullSuite
//
// {
//     {
//         sstore(0, A(2, 1))
//         sstore(1, A(2, 2))
//         sstore(2, A(4, 2))
//     }
//     function A(m, n) -> ret
//     {
//         switch m
//         case 0 { ret := add(n, 1) }
//         default {
//             switch n
//             case 0 { ret := A(sub(m, 1), 1) }
//             default {
//                 ret := A(sub(m, 1), A(m, sub(n, 1)))
//             }
//         }
//     }
// }
