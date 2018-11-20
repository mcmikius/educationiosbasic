let numberSymbol: Character = "三"  // Цифра 3 в упрощенном Китайском языке
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Привет \(name)!")

    guard let location = person["location"] else {
        print("Надеюсь у тебя там хорошая погода.")
        return
    }

    print("Надеюсь в \(location) хорошая погода.")
}

greet(["name": "John"])
// Выведет "Привет John!"
// Выведет "Надеюсь у тебя там хорошая погода."
greet(["name": "Jane", "location": "Cupertino"])
    // Выведет "Привет Jane!"
    // Выведет "Надеюсь в Cupertino хорошая погода.”

