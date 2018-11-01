// Task first

var person: (firstName:String, secondName:String, age:Int) = ("Ivan", "Ivanov", 25)
print("firstName = \(person.firstName), secondName = \(person.secondName), age = \(person.age)")

// Task second
let (x, y, z) = (5, 8, 15)

// Task threerd
var innerTuple: (Int, Int, (Int, (Int, (Int, Int, (Int, Int))))) = (1, 16, (51, (45, (12, 67, (5, 12)))))

innerTuple.2.1.1.2.0

// Task fourst
var a = 5
var b = 4

(b, a) = (a, b)
