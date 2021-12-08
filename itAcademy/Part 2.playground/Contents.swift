import UIKit
import Foundation

let rangeInt = (1, 2...5)
print(rangeInt)

let rangeDouble: ClosedRange<Double> = 1.0 ... 5.1
print(rangeDouble.contains(2.2))
let anotherIntR = 20..<34
anotherIntR.lowerBound // 20
anotherIntR.upperBound
let rr = 1 ..< 5
rr.count
rr.lowerBound
rr.upperBound
rr.last
rr.first
rr.indices
rr.min()
rr.max()

for iteratorItem in 1..<5 { print(iteratorItem*2) }
let successValuesRange = 0.0..<5.0
successValuesRange.contains(7.2) // false

let array: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
array[3..<5] // [0, 1, 2, 3, 4]

let a1 = 1
let a2 = 2
let a3 = 3
var someArray = [1, 2, 3]
someArray == [a1, a2, a3]

var optionalExample = Int?(5)
optionalExample = nil

print(optionalExample ?? a1+2)
