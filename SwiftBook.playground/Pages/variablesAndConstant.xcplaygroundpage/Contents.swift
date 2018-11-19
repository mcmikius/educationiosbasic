// Optional
let possibleNumber = "1234"
let convertedNumber = Int(possibleNumber)
/*if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber).")
}
*/
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

let age = 3
//assert(age >= 0, "Возраст человека не может быть меньше нуля")



if age > 10 {
    print("Ты можешь покататься на американских горках и чертовом колесе.")
} else if age > 0 {
    print("Ты можешь покататься на чертовом колесе.")
} else {
    assertionFailure("Возраст человека не может быть отрицательным.")
}

//thernar
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let contentHeight1 = 40
let hasHeader1 = true
var rowHeight1 = contentHeight1
if hasHeader1 {
    rowHeight1 = rowHeight1 + 50
} else {
    rowHeight1 = rowHeight1 + 20
}


let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

for index in 1...5 {
    print("\(index) умножить на 5 будет \(index * 5)")
}


let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) будет \(names[i])")
}

let dollarSign = "\u{24}"

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"


let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
var instruction = "look over"
instruction += string2
let exclamationMark: Character = "!"
welcome.append(exclamationMark)

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
var shoppingList: [String] = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items.")
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
