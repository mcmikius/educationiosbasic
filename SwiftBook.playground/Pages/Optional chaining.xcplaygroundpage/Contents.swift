
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}


let john = Person()

let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

class Person {
    var residence: Residence?
}


class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
       }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("Общее количество комнат равно \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}
john.residence?.address = createAddress()

func printNumberOfRooms() {
    print("Общее количество комнат равно \(numberOfRooms)")
}

if john.residence?.printNumberOfRooms() != nil {
    print("Есть возможность вывести общее количество комнат.")
} else {
    print("Нет возможности вывести общее количество комнат.")
}

if (john.residence?.address = someAddress) != nil {
    print("Была возможность установить адрес.")
} else {
    print("Не было возможности установить адрес.")
}

if let firstRoomName = john.residence?[0].name {
    print("Название первой комнаты \(firstRoomName).")
} else {
    print("Никак не получить название перовой комнаты.")

john.residence?[0] = Room(name: "Bathroom")


let johnsHouse = Residence()
    johnsHouse.rooms.append(Room(name: "Гостиная"))
    johnsHouse.rooms.append(Room(name: "Кухня"))
    john.residence = johnsHouse

    if let firstRoomName = john.residence?[0].name {
        print("Название первой комнаты \(firstRoomName).")
    } else {
        print("Никак не получить название перовой комнаты.")
    }

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
    testScores["Dave"]?[0] = 91
    testScores["Bev"]?[0] += 1
    testScores["Brian"]?[0] = 72

if let johnsStreet = john.residence?.address?.street {
        print("John's street name is \(johnsStreet).")
    } else {
        print("Unable to retrieve the address.")
    }


let johnsAddress = Address()
    johnsAddress.buildingName = "The Larches"
    johnsAddress.street = "Laurel Street"
    john.residence!.address = johnsAddress

    if let johnsStreet = john.residence?.address?.street {
        print("John's street name is \(johnsStreet).")
    } else {
        print("Unable to retrieve the address.")
    }

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
        print("John's building identifier is \(buildingIdentifier).")
    }
if let beginsWithThe =
        john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
        if beginsWithThe {
            print("John's building identifier begins with \"The\".")
    } else {
            print("John's building identifier does not begin with \"The\".")
    }
    }



