import UIKit

let greeting = "Hello, playground"
print(greeting.uppercased())

let number = 10_000
print(number)
print(number.isMultiple(of: 10))


//string interpolation
let name = "Dom"
let age = 24

let message = "Hello my name is \(name) and my age is \(age)"
print(message)

print("5 x 5 = \(5*5)")

//bool interpretations
var value = true
print(value)
value.toggle()
print(value)
value = !value
print(value)

//arrays
var myArray = ["John","Tom"]
myArray.append("Dom")
print(myArray)
print(myArray.count)
myArray.remove(at: 1) //removes Tom
print(myArray)

//array funtions include .removeAll .contains

//empty arrays
var scores = Array<Int>() //or [Int]() [String]() etc, can only hold 1 type of data
scores.append(8)
scores.append(10)
print(scores)
print(scores[1])

//array.sorted() sorts strings into alphabetical and ints into chronological order
//array.reversed() sorts array into reversed object but returns a reversed array object when called

//DICTIONARIES

let employee = [
    "name" : "Dom",
    "job" : "software engineer",
    "age" : "24"
]

print(employee["name"]) //this will give an optional result as the key ("name") may not be in the dictionary
//to fix this we can add a defult vlaue if the key is not present in the dictionary
print(employee["name", default: "Unknown"])

let olympics = [
    2020: "rio",
    2024: "london",
    2030: "tokyo"
]

print(olympics[2020,default: "Unknown"])

//defining empty dictionary
var heights = [String: Int]() //key:value
heights["Dom"] = 183
heights["Tommy"] = 144
print(heights)

//SETS
//sets are similar to arrays but they remove duplicates & dont remember the order of storage
// normally used to fast look up including no duplicates
//defining a set
var mySet = Set([
"Dom",
"Tom",
"Tommy"
])
print("SETS")
print(mySet) //notice the order of the set prints in a completely random order

//defining an empty set
var myEmptySet = Set<String>()
myEmptySet.insert("Margot Robbie")
myEmptySet.insert("Tom Cruise")
print(myEmptySet)


//ENUMS
print("ENUMS")

enum Weekday {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday //or case mon, tues, wed
}

var day = Weekday.Monday
day = .Tuesday
print(day)


//type annotations
print("TYPE ANNOTATIONS")

let variable = "some string"
var variable2 = 0
//^^ by using let and var, swift uses type inference to infer that you want to save a string and int respectively
//we can explicitly tell swift to set these variables as 100% strings or integers by so

let variable3: String = "some definite string"
var integer2: Double = 1 //saves integer2 variable as a double and not an int

//TYPE ANNOTATION TYPES
//: Int, String, Double, Bool
var someArray: [String] = ["string", "array"] //String array
var emptyArray: [String] = [] // or :[String] = [String]() or [String]()
var someDictionary: [String: Int] = ["string1":1,"string2":2]
var someSet: Set<String> = Set([
"case1",
"case2",
"case3"
])

//Defining empty constants
let username: String //says the constant username is a string but it is not yet asigned



