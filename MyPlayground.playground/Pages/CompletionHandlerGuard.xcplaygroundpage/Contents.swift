func checkText(text: String?, result: (Bool, Int) -> Void) {
    let maxCount = 5
    
    if let count = text?.count {
        count <= 5 ? result(true, maxCount-count) : result (false, count-maxCount)
    }
}


var result = {$0 ? print($1) : print("-\($1)")}

checkText(text: "test", result: result)
checkText(text: "131231", result: result)
checkText(text: " ", result: result)
checkText(text: "stfstfdstfd", result: result)

//guard


func testParams(crWidth:Int?, crHeight:Int?, name:String?, descr:String?){
    guard let width = crWidth else {
        print("critical width is nil")
        return;
    }
    guard let height = crHeight else {
        print("critical height is nil")
        return;
    }
    
    if name == nil {
        print("name is nil")
    }
    
    if descr == nil {
        print("descr is nil")
    }
}

testParams(1, crHeight: 34, name: "nameValue", descr: "desc1")

print()

testParams(nil, crHeight: nil, name: nil, descr: nil)

print()

testParams(1, crHeight: 34, name: nil, descr: nil)

print()

testParams(1, crHeight: 34, name: nil, descr: "desc4")

print()