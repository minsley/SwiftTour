// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// p6 -- const declaration

let myFloat: Float = 2.12345

let label = "The width is "
let width = 94
// Gives a "no + overload" error
// let widthLabel = label + width

// p7 -- easy string format/concat

let myFloat2: Float = 5.4321
let myString = "String formatting: \(myFloat2)"

// p8 -- arrays/dicts

var myArray = ["thing1", "thing2", "thing3"]
var myDict = [
    "color1" : "blue",
    "color2" : "red",
    "noColor" : 2
]

// p10 -- optional values

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = nil // "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, World!"
}

// p11 -- switch

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:    // commenting this out makes the swith invalid
    let vegetableComment = "Everything tastes good in soup."
}

// p12 -- for-in loops

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
largest
largestKind

// p14 -- ranges

var range1 = 1..5
var range2 = 1...5

// p15 -- func

func greet(name: String, lunch: String) -> String {
    return "Hello, \(name). Lunch today will be \(lunch)."
}
greet("Matt", "turducken")

func meanAve(nums: Int...) -> Int {
    var total = 0
    for num in nums {
        total += num
    }
    return total / nums.count
}
meanAve(1,2,3,4,5)

// p19 -- closures

var numbers = [20,19,7,12]
numbers.map({
    (number: Int) -> Int in
    return 1 - number % 2
    })

// p




///////////////////////////////////////////////////////////////////

/*
	p?? -- inheritance and overrides
	"Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area and a describe method on the Circle class."
*/

public class Circle: NamedShape {
	var radius

	init(radius: Double, name: String){
		self.radius = radius
		super.init(name: name)
	}
	
	func area() -> Double {
		return 3.14 * radius * radius
	}
	
	func describe() -> String {
		return "A circle with radius \(radius)."
	}
}





