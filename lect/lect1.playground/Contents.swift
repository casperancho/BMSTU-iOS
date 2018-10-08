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


let names = ["ANna","Kate","Alex"]
for name in names {
    print("Hello, \(name)")
    
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat":4 ]
for (animalName,legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1..<5 {
    print("\(index) умножить на 5 будет \(index*5)")

}

for trickMan in stride(from: 60, to: 0, by: -12)
{
    print(trickMan)
    
}

var square = 0
while square < 4 {
    square += 1
    print(square)
}


let someCharacter : Character = "z"
switch someCharacter {
case "a":
    print("First")
case "z":
    print("Last")
default:
    print("Other")
}



func divInt (a:Int, b:Int)->Int{
    guard
        a != 0,
        b != 0
        else {return 0}
    return (a/b)
}

print(divInt(a: 12, b: 3))
print(divInt(a: 0, b: 3))



func hello(_ name : String){
    print(name)
}

hello("Artem")

let optionalName : String?
optionalName = "Kate"
optionalName!

if let name = optionalName {
    print(name)
}else{
    print("cant")
}

//------------------


//струкутры

struct Human{
    let name : String
    var age: Int
    
    
    init (v1:String, age:Int){
        name = v1
        self.age = age
    }
    
    func SayHello(){
        print(hello)
    }
}

var human = Human(v1:"Oleg", age:20)
human.SayHello()

//Классы

class Animal{
    let name : String
    let age : Int
    
    init(v1: String, age: Int) {
        name = v1
        self.age = age
    }
    func SayHello(){
        print(hello)
    }
}

class Cat : Animal{
    func SayMurMur(){
        print("мурмурмур")
    }
    
    override func SayHello(){
            super.SayHello()
        print("World!")
    }
}

let cat = Cat(v1: "Мурка", age: 4)
cat.SayHello()
cat.SayMurMur()

//Enum
enum AnimalType
{
    case cat
    case dog
    case pig
    case fox
    
}

let typeCat = AnimalType.cat
let typeDog : AnimalType = .cat

switch typeCat {
case .cat:
    print("кошка")
case .dog:
    print("гав")
default:
    print("грусть печаль")
}


protocol Runable{
    func run()
}

class Hen: Animal,Runable{
    func run() {
        print("Побежали")
    }
}


let hen = Hen(v1:"Курочка", age:1)
hen.SayHello()
hen.run()
