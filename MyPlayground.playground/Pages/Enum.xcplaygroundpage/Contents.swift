enum Season{
    case spring
    case summer
    case autumn
    case winter
}

enum Month {
    
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    
    
    static func months(season:Season) -> [Month]{
        switch season {
        case .winter:
            return [december, january, february]
        case .spring:
            return [march, april, may]
        case .autumn:
            return [september, october, november]
        case .summer:
            return [june, july, august]
            
        }
        
    }
    
}


var m = Month.months(.autumn)



//Calc

struct Calc{
    
    enum Operation: Int {
        
        case append
        case substract
        case multiply
        case divide

    }
    
    func calc(array: [Int], operation: Operation) -> Int {
        
        var result = 0
        
        switch operation {
        case .append:
            result = array.reduce(0){$0 + $1}
        case .substract:
            result = array.reduce(0){$0 - $1}
        case .multiply:
            result = array.reduce(1){$0 * $1}
        case .divide:
            result = array.reduce(10000){$0 / $1}
            
        }
        
        return result
        
        
    }
    
}


var c = Calc()

c.calc([1,5,1,4], operation: .append) // полный путь enum .append можно не указывать

c.calc([7,5,1,4], operation: .multiply)

c.calc([9,5,1,12], operation: .substract)

c.calc([100,5,4,1], operation: .divide)



