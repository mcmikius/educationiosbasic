struct Team{
    
    var name:String = "noname"
    
    let maxPlayersCount: Int
    
    var players:[String?]!
    
    var count:Int {
        return players.filter { !($0 ?? "").isEmpty}.count
    }
    
    var desc: String = "desc"
    
    init(maxPlayersCount:Int){
        self.maxPlayersCount = maxPlayersCount
        players = [String?](repeating: nil, count: self.maxPlayersCount)
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
    
    
    
    func printPlayers(){
        for player in players {
            if let player = player{
                print(player)
            }
        }
    }
    
    
}


let count = 10

var team1 = Team(maxPlayersCount: count)


for index in 0..<count {
    team1.players[index] = String(index+1)
}


team1.printPlayers()

