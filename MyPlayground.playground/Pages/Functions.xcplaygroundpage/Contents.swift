// Home task #1

func convertParams(str1:String?, str2:String?, str3:String?) -> Int? {
    
    var sum: Int?
    
    let n1 = Int(str1 ?? "") ?? 0
    let n2 = Int(str2 ?? "") ?? 0
    let n3 = Int(str2 ?? "") ?? 0
    
    sum = n1 + n2 + n3
    
    return sum

}
var success = convertParams("6", str2:"22", str3:"123");

var fail = convertParams("asd", str2: "22", str3: "123");

var successWithNill = convertParams(nil, str2: "56", str3: "251");

if let sum = success {
    print(sum)
}else{
    print("fail")
}

if let sum = fail {
    print(sum)
}else{
    print("fail")
}

if let sum = successWithNill {
    print(sum)
}else{
    print("fail")
}

// Home task #2

func convertParams2(str1:String?, str2:String?, str3:String?) -> Int? {
    
    var sum: Int?
    
    if1: if let str1 = str1, let str2 = str2, let str3 = str3 {
        
        if let n1 = Int(str1), let n2 = Int(str2), let n3 = Int(str3){
            
            sum = n1 + n2 + n3
            
        }else{
            break if1
        }
    }
    
    return sum
    
}
var success2 = convertParams2("6", str2:"22", str3:"123");

var fail2 = convertParams2("asd", str2: "22", str3: "123");

var successWithNill2 = convertParams2(nil, str2: "56", str3: "251");

print("-------")

if let sum = success2 {
    print(sum)
}else{
    print("fail")
}

if let sum = fail2 {
    print(sum)
}else{
    print("fail")
}

if let sum = successWithNill2 {
    print(sum)
}else{
    print("fail")
}