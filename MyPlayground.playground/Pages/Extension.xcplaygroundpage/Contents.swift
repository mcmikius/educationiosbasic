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

extension Player{
    
    func raiseSalary(quantity:UInt) -> UInt {
        return calcSalary(quantity: quantity)
    }
    
    func calcSalary(quantity: UInt) -> UInt {
        return salary * quantity * age
    }
    
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
    
    var count:Int {get}
    
    func printPlayers()
    
    func showPlayersSalary(amount: UInt) -> [UInt: Player?]
    
}

extension Team{
    
    // computed property
    var count:Int {
        return players.filter { $1 != nil }.count // $0 - key, $1 - value
    }
    
    func showPlayersSalary(amount: UInt) -> [UInt: Player?] {
        return players.filter {
            $1!.salary >= amount
        }
    }
    
}


class BasePerson : Person {
    
    var name = ""
    var age:UInt = 0
    
    init(name: String, age: UInt) {
        self.name = name
        self.age = age
    }
    
}


class FootballCoach : BasePerson, Coach {
    
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
    
    
    
    func kickTheBall() {
        print("kicked the ball")
    }
    
    func move() {
        print("\(name): run", terminator:"")
    }
    
}


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
    
    var players:[UInt:Player?] = [UInt:FootballPlayer?]()
    
    
    var coach:Coach
    
    init(name:String, coach:Coach) {
        self.name = name
        self.coach = coach
    }
    
    
    func playMatch(){
        players.forEach(){$1?.move()}
    }
    
    func printPlayers() {
        print("own impl")
    }
}



extension Team{
    
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
var forward = Forward(name: "David", age: 20, number: 10, salary: 2500)

team.players[defender.number] = defender
team.players[forward.number] = forward

team.players[4] = nil
team.players[11] = nil

team.count

team.showPlayersSalary(amount: 2000).count

