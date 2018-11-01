
//Task one
var age = 20

//use if

if age < 10{
    print("baby")
}else if age > 10 && age <= 15{
    print("teenager")
}else if age > 15 && age <= 20{
    print("student")
}else if age > 20 && age <= 30{
    print("young")
}else if age > 30 && age <= 40{
    print("proffesional")
}else if age > 40 && age <= 60{
    print("adult")
}else if age > 60 {
    print("old")
}

//switch

switch age {

case 0...10:
    print("baby")

case 11...15:
    print("teenager")

case 16...20:
    print("student")
    
case 21...30:
    print("young")
case 31...40:
    print("proffesional")
case 41...60:
    print("adult")
case 60...:
    print("old")
    
default:
    print("null")
}
