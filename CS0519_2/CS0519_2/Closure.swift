

import SwiftUI

let add = {
    (num1: Int, num2: Int) -> Int in 
    let result = num1 + num2
    return result
    }

let wow = { -$0 }

print(add(1, 3))
print(wow(1))
