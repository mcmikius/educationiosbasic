import Foundation


func randomNumber(lower: UInt32, upper: UInt32) -> UInt{
    return UInt(arc4random_uniform((upper+1) - lower) + lower)
}

for _ in 1...10 {
    print(randomNumber(1, upper: 10))
}




enum Month:Int {
    
    case january = 1,
    february,
    march,
    april,
    may,
    june,
    july,
    august,
    september,
    october,
    november,
    december
    
    
    static func randomMonth() -> Month{
        
        let lower:UInt32 = 1
        let upper:UInt32 = 12
        let number = randomNumber(lower, upper: upper)
        
        return Month(rawValue: Int(number))!
    }
    
}

for _ in 1...12 {
    print(Month.randomMonth())
}

