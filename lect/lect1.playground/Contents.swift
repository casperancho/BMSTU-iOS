//: Playground - noun: a place where people can play

import Foundation
let apples = 10


var score = 0
score = 1

let teststring : String = "Hello"

print(teststring)

var array: [Int] = []
array = [1,8,9,5]

var arraystring = ["one","two"]
array.append(12)
array.sort()

array.append(contentsOf: [11,16])


array.removeAll()
array = [2,5,6,2]
print(array.contains(2))


// множества

var set = Set<Int>([])
set.insert(1)
print(set.count)
//set.removeAll()
var set2 = Set<Int>([5,7])
set.union(set2)

// словари

var dictionary : [Int: String] = [
    1: "One",
    2: "Two",
    3: "three"
]

print(dictionary[2])
