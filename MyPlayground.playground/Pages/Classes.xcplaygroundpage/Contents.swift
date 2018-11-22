class Team {
    
    var coach:Coach
    
    var name:String = "noname"
    
    let maxPlayersCount: Int
    
    var players:[Player?]!
    
    var count:Int {
        return players.filter { $0 != nil }.count
    }
    
    var desc: String = "desc"
    
    init(maxPlayersCount:Int, coach: Coach){
        self.maxPlayersCount = maxPlayersCount
        self.coach = coach
        players = [Player?]()
    }
    
    init(coach: Coach){
        self.maxPlayersCount = 100
        self.coach = coach
    }
    
    
    convenience init(name: String, desc: String, maxPlayersCount:Int, coach: Coach) {
        self.init(maxPlayersCount: maxPlayersCount, coach: coach)
        self.name = name
        self.desc = desc
    }
    
    
    
    var salary = 0 {
        didSet {
            if count == 0 {
                salary = 0
            }
            
        }
    }
    
    
    var budget:Int{
        get {
            return salary * count
        }
        
        set{
            if count == 0{
                self.salary = 0
            }else{
                self.salary = Int(newValue / count)
            }
        }
    }
    
    
    subscript (index: Int) -> Player?{
        
        get{
            if index > maxPlayersCount{
                print ("вышли за предел массива")
                return nil
            }else{
                return players[index]
            }
        }
        
        
        set{
            if let player = newValue where players[index] != nil{
                if checkAge(player) {
                    players[index] = player
                }
            }
            
        }
    }
    
    
    func printPlayers(){
        for player in players {
            if let player = player{
                print(player.name, player.age)
            }
        }
    }
    
    func addPlayer(player:Player){
        
        if count >= maxPlayersCount{
            print("команда уже полная, не могу добавить \(player.name)")
            return
        }
        
        if (checkAge(player)){
            players.append(player)
        }
    }
    
    
    
    static func checkString(text:String) -> Bool {
        return !text.contains("-")
    }
    
    // вынесли все условия проверки в отдельный метод
    func checkAge(player:Player) -> Bool{
        
        // можно использовать guard вместо if
        if player.age < 20{
            print("нельзя добавлять \(player.name) < 20 лет")
            return false
        }
        
        if player.age > coach.age{
            print("игрок \(player.name) (\(player.age)) не может быть старше тренера (\(coach.age))")
            return false
        }
        
        return true
        
    }
    
    
}


class Player{
    
    var name:String
    var age:UInt
    
    init(name:String, age:UInt){
        self.name = name
        self.age = age
    }
    
    convenience init(name:String){
        self.init(name: name, age: 0)
    }
}


class Coach{
    var name:String
    var age:UInt
    var experience:UInt // опыт не может быть отрицательным
    
    init(name:String, age:UInt, experience:UInt){
        self.name = name
        self.age = age
        self.experience = experience
    }
    
    convenience init(name:String, age:UInt){
        self.init(name: name, age: age, experience:0)
    }
    
}


var p1 = Player(name: "player1", age:24)
var p2 = Player(name: "player2", age:21)
var p3 = Player(name: "player3", age:19)
var p4 = Player(name: "player4", age:25)
var p5 = Player(name: "player5", age:28)
var p6 = Player(name: "player6", age:48)
var p7 = Player(name: "player7", age:17)

var coach = Coach(name: "coach name", age: 45)


var team = Team(maxPlayersCount: 5, coach: coach)


team.addPlayer(p1)
team.addPlayer(p2)
team.addPlayer(p3) // младше 20
team.addPlayer(p4)
team.addPlayer(p5)
team.addPlayer(p6) // старше тренера
team.addPlayer(p7) // младше 20


team.printPlayers()


