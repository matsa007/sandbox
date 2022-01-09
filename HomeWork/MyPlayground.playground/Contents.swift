import UIKit

let intervals = [[1,3],[2,6],[8,10],[15,18]]
print(intervals[0][1])
let outCount = intervals.count - 1
let inCount = intervals[outCount].count
var outputArr:[Array<Int>] = [[]]
outputArr.append([2])
outputArr.insert([2], at: 0)
outputArr.append(contentsOf: <#T##Sequence#>)([2], at: 0)
