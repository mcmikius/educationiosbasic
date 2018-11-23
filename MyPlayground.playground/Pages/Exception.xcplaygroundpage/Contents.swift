// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html


// содержит типы ошибок
enum VendingMachineError: Error { // Error помечает enum, что здесь хранятся типы собственных ошибок
    case invalidSelection(person:Person) // неверно сделали заказ (неверный выбор)
    case insufficientFunds(person:Person, coinsNeeded: Int) // не хватает денег
    case outOfStock(person:Person) // не осталось продуктов на складе
    case invalidAge(person:Person, ageNeeded: Int) // не подходит возраст
}

// продукт для заказа
struct Item {
    var price: Int
    var count: Int
}

struct Person{
    let name: String
    var age: Int
}


// машина для продажи продуктов
class VendingMachine {
    
    static let minAge = 15 // константа для хранения мин. возраста
    
    // набор продуктов, которые можно заказать (dictionary)
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    // сколько заплатили
    var coinsDeposited = 0
    
    // процесс заказа
    func vend(itemNamed name: String, person:Person) throws {
        
        // есть ли такой продукт в наличии
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection(person:person) // вручнуб выбрасываем исключение
        }
        
        // есть ли вообще товары на складе
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock(person:person)
        }
        
        // хватает ли денег на покупку
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(person:person,coinsNeeded: item.price - coinsDeposited)
        }
        
        // подходит ли возраст
        guard person.age > VendingMachine.minAge else {
            throw VendingMachineError.invalidAge(person:person, ageNeeded: VendingMachine.minAge - person.age)
        }
        
        // отнимаем из депозита сумму
        coinsDeposited -= item.price
        
        
        // уменьшаем количество соотв. товаров на 1
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing: \(name) for \(person.name)")
    }
}




func buyFavoriteSnack(person: Person, vendingMachine: VendingMachine) throws { // перебрасывает ошибку выше в место вызова функции
    
    let snackName = favoriteSnacks[person.name] ?? "Candy Bar" // если у человека нет любимого продукта - значит это будет "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName, person: person) // заказать продукт
}



func test1(person:Person, coins: Int){
    
    
    let vendingMachine = VendingMachine()
    
    vendingMachine.coinsDeposited = coins // вносим деньги
    
    do {
        try buyFavoriteSnack(person: person, vendingMachine: vendingMachine)
    } catch VendingMachineError.invalidSelection(let person) {
        print("Invalid Selection: \(person.name)")
    } catch VendingMachineError.outOfStock(let person) {
        print("Out of Stock: \(person.name)")
    } catch VendingMachineError.insufficientFunds(let person, let coinsNeeded) { // константа будет хранить сумму, которой не хватило
        print("Insufficient funds. Please insert an additional \(coinsNeeded) coins: \(person.name)")
    } catch VendingMachineError.invalidAge(let person, let ageNeeded) { // константа будет хранить сумму, которой не хватило
        print("invalid age, need additionally \(ageNeeded): \(person.name)")
    }
    catch { // если произошла другая ошибка
        print(error) // хранит ошибку
    }
    
}




// кто что любит заказывать

var alice = Person(name:"Alice", age:26)
var bob = Person(name:"Bob", age:21)
var eve = Person(name:"Eve", age:12)

let favoriteSnacks = [
    alice.name: "Chips",
    bob.name: "Licorice",
    eve.name: "Pretzels",
]


test1(person: alice, coins: 100)
test1(person: bob, coins: 19)
test1(person: eve, coins: 50)


