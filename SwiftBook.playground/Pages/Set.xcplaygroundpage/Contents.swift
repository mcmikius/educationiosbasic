var letters = Set<Character>()
print("letters имеет тип Set<Character> с \(letters.count) элементами.")

letters.insert("a")

letters = []

//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
print("У меня есть \(favoriteGenres.count) любимых музыкальных жанра.")

if favoriteGenres.isEmpty {
    print("Мне все равно какая музыка играет. Я не придирчив.")
} else {
    print("У меня есть свои музыкальные предпочтения.")
}

favoriteGenres.insert("Jazz")
favoriteGenres.remove("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? С меня хватит.")
} else {
    print("Меня это не сильно заботит.")
}

if favoriteGenres.contains("Funk") {
    print("О! Да я встал с правильной ноги!")
} else {
    print("Слишком много Funk'а тут.")
}
/*
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()

oddDigits.intersection(evenDigits).sorted()

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
*/
//Dictionary
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"

airports["APL"] = nil

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)

let airportNames = [String](airports.values)