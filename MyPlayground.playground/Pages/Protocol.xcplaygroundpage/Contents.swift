protocol Person{
    
    var name:String {get set}
    var age:UInt {get}
    
}


protocol Player : Person{
    
    var number:UInt {get set}
    
    var salary:UInt {get set}
    
    mutating func raiseSalary(quantity:UInt) -> UInt
    
    func move()
    
}


protocol FootballPlayer : Player{
    
    func kickTheBall() // пнуть мяч
    
}


protocol Coach : Person{
    
    func training()  // тренировать
}


protocol Team{
    
    var maximumPlayersCount: UInt {get}
    
    var players:[UInt:Player?] {get set}
    
    var coach:Coach {get set}
    
    var name:String {get set}
    
    func printPlayers()
}


class BasePerson : Person { // базовый класс для всех людей
    
    var name = ""
    var age:UInt = 0
    
    init(name: String, age: UInt) {
        self.name = name
        self.age = age
    }
    
}



class FootballCoach : BasePerson, Coach { // футбольный тренер
    
    override init(name: String, age: UInt) {
        super.init(name: name, age: age)
    }
    
    func training() {
        print("train football")
    }
    
}


class BaseFootballPlayer : BasePerson, FootballPlayer{
    
    var number:UInt
    var salary:UInt
    
    init(name: String, age: UInt, number:UInt, salary: UInt) {
        self.number = number
        self.salary = salary
        super.init(name: name, age: age)
    }
    
    init(name: String, age: UInt, number:UInt) {
        self.number = number
        self.salary = 0
        super.init(name: name, age: age)
    }
    
    
    override init(name: String, age: UInt) {
        self.number = 0
        self.salary = 0
        super.init(name: name, age: age)
    }
    
    // поднять зп
    func raiseSalary(quantity:UInt) -> UInt {
        salary = salary * quantity
        return salary
    }
    
    func kickTheBall() {
        print("kicked the ball")
    }
    
    func move() {
        print("\(name): run", terminator:"")
    }
    
}

// спец. игрок - защитник
class Defender : BaseFootballPlayer{
    
    override init(name: String, age: UInt, number:UInt, salary: UInt) {
        super.init(name: name, age: age, number: number, salary: salary)
    }
    
    override func kickTheBall() {
        print("kick back")
    }
    
    override func move() {
        super.move()
        print(" back")
    }
}

// спец. игрок - нападающий
class Forward : BaseFootballPlayer{
    
    override init(name: String, age: UInt, number:UInt, salary: UInt) {
        super.init(name: name, age: age, number: number, salary: salary)
    }
    
    override func kickTheBall() {
        print("kick forward")
    }
    
    
    override func move() {
        super.move()
        print(" forward")
    }
}


class FootballTeam : Team{
    
    var name: String
    
    var maximumPlayersCount:UInt = 11
    
    // слева - Player, справа - FootballPlayer
    var players:[UInt:Player?] = [UInt:FootballPlayer?]()
    //        var players:[UInt:FootballPlayer?] = [UInt:FootballPlayer?]() // такое решение не подойдет, т.к. не соответствует протоколу
    
    var coach:Coach
    
    init(name:String, coach:Coach) {
        self.name = name
        self.coach = coach
    }
    
    // реализация изменилась, т.к. коллекция изменилась
    func playMatch(){
        
        // применяется полиморфизм, т.к. в коллекции находятся разные реализации Player - каждая будет выполнять метод move по-своему
        players.forEach(){$1?.move()} // используем параметр $1 - это сам Player, $0 - ключ
    }
    
    
    // метод printPlayers использует forEach
    func printPlayers(){
        players.forEach(){
            if let player = $1{
                print($0, player.name)
            }
        }
    }
    
}

var footballCoach = FootballCoach(name: "mr. Trainer", age: 40)

var team = FootballTeam(name: "Dream Team", coach: footballCoach)

var defender = Defender(name: "Tom", age: 24, number: 2, salary: 1000)
var forward = Forward(name: "David", age: 20, number: 10, salary: 2000)

team.players[defender.number] = defender
team.players[forward.number] = forward

team.playMatch()

team.printPlayers()


