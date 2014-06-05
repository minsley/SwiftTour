// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

/*
    const declaration
    "Create a constant with an explicit type of FLoat and a value of 4."
*/

let myFloat: Float = 2.12345

/*
    type conversion
    "Try removing the conversion to String from the last line. What error do you get?"
*/

let label = "The width is "
let width = 94

let widthLabel = label + String(width)
// let widthLabel = label + width   // no + overload error

/*
    easy string format/concat
    “Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.”
*/

let myFloat2: Float = 5.4321
let myString = "String formatting: \(myFloat2)"

/*
    arrays/dicts
*/

var myArray = ["thing1", "thing2", "thing3"]
var myDict = [
    "color1" : "blue",
    "color2" : "red",
    "noColor" : 2
]

/*
    optional values
    “Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.”
*/

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = nil // "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, World!"
}

/* 
    switch
    “Try removing the default case. What error do you get?”
*/

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

/* 
    for-in loops
    “Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.”
*/

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

/*
    ranges
*/

var range1 = 1..5
var range2 = 1...5

/* 
    func
    “Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.”
*/

func greet(name: String, lunch: String) -> String {
    return "Hello, \(name). Lunch today will be \(lunch)."
}
greet("Matt", "turducken")


/*
    func
    "Write a function that calculates the average of its arguments."
*/

func meanAve(nums: Int...) -> Int {
    var total = 0
    for num in nums {
        total += num
    }
    return total / nums.count
}
meanAve(1,2,3,4,5)

/*
    closures
    "Write the closure to return zero for all odd numbers."
*/

var numbers = [20,19,7,12]
numbers.map({
    (number: Int) -> Int in
    return (number + 1) % 2
    })

/*
    closures abbr
*/

var numbers2 = [20,19,7,12]
numbers2.map({num in (num+1)%2})

/*
    numbered params
*/

sort([1,5,3,12,2]) {$0 > $1}

/*
    classes and objects
    “Add a constant property with let, and add another method that takes an argument.”
*/

class Shape {
    var numberOfSides = 4
    let name = "square"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func perfectAngles(sides: Int) -> Int {
        return 360 / sides
    }
}

var square = Shape()
square.perfectAngles(square.numberOfSides)

/*
    Object CTor/DTor (init/deinit)
*/

class NamedShape {
    var numSides: Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    deinit{
        self.name = ""
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numSides) sides."
    }
}

/*
	inheritance and overrides
	"Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area and a describe method on the Circle class."
*/

class Circle: NamedShape {
    var radius: Double

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

/*
    willSet and didSet
*/

class Car {
    var running: Bool
    var moving: Bool
    
    init(){
        self.running = false
        self.moving = false
    }
    
    init(run: Bool, move: Bool){
        self.running = run
        self.moving = move
    }
}

class CarAndTailgater {
    
    var honda: Car {
    willSet {
        vw.moving = newValue.moving
    }
    }
    
    var vw: Car{
    willSet {
        honda.moving = newValue.moving
    }
    }
    
    init(){
        honda = Car()
        vw = Car()
    }
}

var morningCommute = CarAndTailgater()
morningCommute.honda = Car(run: true, move: false)
morningCommute.vw.running
morningCommute.honda = Car(run: true, move: true)
morningCommute.vw.moving

/*
    enum
    “Write a function that compares two Rank values by comparing their raw values.”
*/

    enum Rank: Int {
        case Ace = 1
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        func simpleDescription() -> String {
            switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.toRaw())
            }
        }
    }

func compareRanks(rank1: Rank, rank2: Rank) -> String {
    if(rank1.toRaw() > rank2.toRaw()) {
        return "\(rank1.simpleDescription()) > \(rank2.simpleDescription())"
    } else if (rank1.toRaw() < rank2.toRaw()) {
        return "\(rank2.simpleDescription()) > \(rank1.simpleDescription())"
    } else {
        return "\(rank1.simpleDescription()) == \(rank2.simpleDescription())"
    }
}

compareRanks(Rank.Ace, Rank.Eight)

/*
    enum 2
    “Add a color method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.”
*/

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        default:
            return "red"
        }
    }
}

Suit.Hearts.color()
Suit.Spades.color()

/*
    structs
    Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit."
*/

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func deck() -> Card[]{
        var deck: Card[]
        for s in Suit.toArray() {
            
        }
        return deck
    }
}









