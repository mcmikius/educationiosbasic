//Closure
let testClosure = {
    print("test")
}

testClosure()

//Closure with parametr
var printNumber: (Int) -> () = { (number) in
    print(number)
}

printNumber(5)

var printTextAndNumber: (Int, String) -> (String) = { (number, text) in
    return "\(text): \(number)"
}

printTextAndNumber(5, "test text ")

var sum1: (Int, Int) -> Int = { (number1, number2) in
    return number1 + number2
}

var sum2: (Int, Int) -> Int = { number1, number2 in
    return number1 + number2
}

var substraction: (Int, Int) -> Int = { (number1, number2) in
    return number1 - number2
}

var sum3: (Int, Int) -> Int = { return $0 + $1 }

sum1(15, 20)
sum2(22, 20)
substraction(30, 15)

sum3(22, 20)


//var testConst: (String) -> String = {
//    var str = $0
//    str.append(" -new, text")
//    return str
//}
//
//testConst("base text")

//var customersInLine = ["Cris", "Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)
//
//let customerProvider = { customersInLine.remove(at: 0) }
//
//print(customersInLine.count)
//
//print("Now serving \(customerProvider())!")
//
//print(customersInLine.count)

//
//typealias TwoDigitsFunction = (Int, Int) -> Int
//
//func testCalc(_ numberOne:Int, _ numberTwo:Int, _ calcFunc:TwoDigitsFunction) -> Int {
//    return calcFunc(numberOne, numberTwo)*100
//}
//var sum = testCalc(4,2, { return $0 + $1 })
//var minus = testCalc(2,5, { return $0 - $1 })
//var multiply = testCalc(4,8, { return $0 * $1 })
//var divide = testCalc(11,3, { return $0 / $1 })
//
//sum
//minus
//multiply
//divide

//Home Work #1

typealias TwoDigitsFunc = (Int, Int) -> Int
typealias OutputFormat = (Int) -> String

func printFormat(_ n1:Int, _ n2:Int, output:OutputFormat, calcFunc:TwoDigitsFunc){
    let result = calcFunc(n1, n2)
    print(output(result))
}

var shortOutput:(Int)->String = { return "output: \($0)"}
var longOutput:(Int)->String = { return "result of the function: \($0)"}
var noOutput:(Int)->String = { return "\($0)"}

var sum: TwoDigitsFunc = { return $0 + $1 }
var minus: TwoDigitsFunc = { return $0 - $1 }
var multiply: TwoDigitsFunc = { return $0 * $1 }
var divide: TwoDigitsFunc = { return $0 / $1 }

printFormat(4, 2, output: shortOutput, calcFunc: sum)
printFormat(4, 2, output: longOutput, calcFunc: sum)
printFormat(4, 2, output: noOutput, calcFunc: divide)


//Home Work #2

var closureArray: [() -> ()] = []

var index = 1
for _ in 1...5 {
    closureArray.append { [index] in
        print(index)
        //error in closureArray without [index] in
    }
    index += 1
}

closureArray[0]()
closureArray[1]()
closureArray[2]()
closureArray[3]()
closureArray[4]()

