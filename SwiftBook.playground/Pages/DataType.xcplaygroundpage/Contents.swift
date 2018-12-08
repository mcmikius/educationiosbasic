var floatData: Float = 4.0
print(floatData)

let label = "The wigth is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//let quotation = """Even though there's whitespace to the left, the actual lines aren't indented. Expect for this line. Double quotes(") can appear without being escaped. I still have \(apples + oranges) pieces of fruit."""
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bootle of water"

var occupations = ["Malcom": "Captain", "Kaylee": "Mechanic"]
occupations["Jayne"] = "Public Relations"

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}


let vegetable = "red pepper"
switch vegetable {
case "celery":
    _ = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    _ = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    _ = "Is it a spicy \(x)?"
default:
    _ = "Everything tastes good in soup."
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var moreLargest = 4
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > moreLargest {
            moreLargest = number
        }
    }
}
print(moreLargest)

//func
func greet(_ person: String, on day: String, eat meal: String) -> String {
    return "Hello \(person), today is \(day), eat \(meal)."
}
greet("Bob", on: "Tuesday", eat: "Eags")

//closure
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
}
}
return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})


//enum
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
