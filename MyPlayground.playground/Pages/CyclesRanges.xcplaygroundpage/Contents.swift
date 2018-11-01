//Task One
for number in 1...100 where String(number).contains("1"){
    print(number)
}
for number in 1...200 where String(number).contains("2"){
    print(number)
}

//TaskTwo

for _ in 1...5 {
    for _ in 1...5{
        print("#", terminator:" ")
    }
    
    print("")
}
print("")
for _ in 1...10 {
    for _ in 1...10{
        print("#", terminator:" ")
    }
    
    print("")
}
print("")

//TaskThree

for x in 1...10 {
    var resultStr = ""
    
    for _ in 1...x {
        resultStr = resultStr + "# "
    }
    print(resultStr)
}

//TaskFour

var i = 0
var sum = 0

while i <= 100 {
    i = i + 1
    if i % 2 == 0{
        sum = sum + i
        print(i, terminator: "|")
    }
}

print("sum = \(sum)")

