struct Team{
    
    var name:String = "noname"
    
    let maxPlayersCount: Int
    
    var players:[Player?]!
    
    var count:Int {
        return players.filter { $0 != nil }.count
    }
    
    var desc: String = "desc"
    
    init(maxPlayersCount:Int){
        self.maxPlayersCount = maxPlayersCount
        players = [Player?]()
    }
    
    init(name: String, desc: String, maxPlayersCount:Int) {
        self.init(maxPlayersCount: maxPlayersCount)
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
            if players[index] != nil{
                players[index] = newValue
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
    
    let minAge = 20
    
    mutating func addPlayer(player:Player){
        
        
        // можно использовать guard вместо if
        
        if count == maxPlayersCount{
            print("команда уже полная, не могу добавить \(player.name)")
            return
        }
        
        if player.age < minAge{
            print("нельзя добавлять \(player.name) < 20 лет")
            return
        }
        
        players.append(player)
    }
    
    
    mutating func release(){
        self = Team(maxPlayersCount: maxPlayersCount) // обнуляет команду
    }
    
    
    static func checkString(text:String) -> Bool {
        return !text.contains("-")
    }
    
    
}


struct Player{
    var name:String
    var age:UInt
}



var team = Team(maxPlayersCount: 5)


team.addPlayer(Player(name: "player1", age:24))
team.addPlayer(Player(name: "player2", age:21))
team.addPlayer(Player(name: "player3", age:19)) // не добавит
team.addPlayer(Player(name: "player4", age:25))
team.addPlayer(Player(name: "player5", age:28))
team.addPlayer(Player(name: "player6", age:22))
team.addPlayer(Player(name: "player7", age:31)) // не добавит

team.printPlayers()