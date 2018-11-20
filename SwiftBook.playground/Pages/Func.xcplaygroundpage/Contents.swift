func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet("Anna"))
// Prints "Hello, Anna!"
print(greet("Brian"))
// Prints "Hello, Brian!


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain("Anna"))
// Выведет "Hello again, Anna!

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person)
    } else {
        return greet(person)
    }
}
print(greet("Tim", alreadyGreeted: true))

/*
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
 */

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
    
}
if let bounds = minMax([8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet("Bill", from: "Cupertino"))

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

arithmeticMean(3, 8.25, 18.75)

func swapTwoInts(inout _ a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}


var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")


mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")


let anotherMathFunction = addTwoInts

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

func stepForward(_ input: Int) -> Int {
    
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


func chooseStepFunction2(backward2: Bool) -> (Int) -> Int {
    func stepForward2(input2: Int) -> Int { return input2 + 1 }
    func stepBackward2(input2: Int) -> Int { return input2 - 1 }
    return backward2 ? stepBackward2 : stepForward2
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(currentValue2 > 0)
// moveNearerToZero теперь ссылается на вложенную функцию stepForward()
while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerToZero2(currentValue2)
}
print("zero!")

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

