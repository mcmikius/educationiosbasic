class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}


let counter = Counter()
// начальное значение counter равно 0
counter.increment()
// теперь значение counter равно 1
counter.increment(by: 5)
// теперь значение counter равно 6
counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(1.0) {
    print("Эта точка находится справа от линии, где x == 1.0")
}

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("Сейчас эта точка на (\(somePoint.x), \(somePoint.y))")

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

/* struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
  
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


 
 
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}
 
var player = Player(name: "Argyrios")
 player.complete(level: 1)
 print("Самый последний доступный уровень сейчас равен \(LevelTracker.highestUnlockedLevel)")
 
 
player = Player(name: "Beto")
 if player.tracker.advance(to: 6) {
 print("Игрок на уровне 6")
 } else {
 print("Уровень 6 еще не разблокирован")
 }
 */

struct  TimesTable{
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("шесть умножить на три будет \(threeTimesTable[6])")


var numberOfLegs = ["паук": 8, "муравей": 6, "кошка": 4]
numberOfLegs["птичка"] = 2


/*
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {assert(indexIsValid(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

func indexIsValid(row: Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
}
let someValue = matrix[2, 2]
*/

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "движется на скорости \(currentSpeed) миль в час"
    }
    func makeNoise() {
        //ничего не делаем, так как не каждый транспорт шумит
    }
}
let someVehicle = Vehicle()
print("Транспорт: \(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Велосипед: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Тандем: \(tandem.description)")

class Train: Vehicle {
    override func makeNoise() {
        print("Чу-чу")
    }
}
let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " на передаче \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Машина: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar ()
automatic.currentSpeed = 35.0
print("Машина с автоматом: \(automatic.description)")


