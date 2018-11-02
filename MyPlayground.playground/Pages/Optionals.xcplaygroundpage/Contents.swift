//TaskOne
var str1:String! = "test1"
var str2:String? = "test2"
var str3:String = "test3"
var str4:String?? = "test4"

print(str1)
print(str2)
print(str3)
print(str4!!)

//TaskTwo varOne
var text:String? = "Swift has built-In support for chekking API avaibility, which ensure that you don't accidentally use APIs that are unvailable on a given deployment target"

if let text = text{
    var trimedText = ""
    for letter in text.characters {
        if String(letter) == " " {
            continue
        }
        trimedText.append(letter)
    }
    print(trimedText)
}
//TaskTwo varTwo
import Foundation

let result = text?.replacingOccurrences(of: " ", with: "")

print(result!)

//TaskThree


