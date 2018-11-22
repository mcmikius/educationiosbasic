//struct

struct Team{
    
    static let maxPlayerCount = 11
    
    var name:String = "noname"
    
    var players = [String?](repeting: nil, count: maxPlayerCount)
    
    var count:Int {
        return players.filter { !($0 ?? "").isEmpty}.count
    }
    
    var desc: String = "desc"
    
    var salary = 0 {
        didSet {
            if count == 0 {
                salary = 0
            }
            
        }
    }
    
    
    var budget:Int{
        get {
            return salary * count // если count = 0, то уножение тоже даст 0
        }
        
        set{
            if count == 0{ // также это защита от деления на ноль
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

var team1 = Team()
team1.players[0] = "player1"
team1.players[1] = "player2"
team1.players[2] = "player3"

team1
team1.count
team1.budget = 60000
team1.salary
