protocol Container {
    associatedtype Item
    mutating func append(item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    // исходная реализация IntStack
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // удовлетворение требований протокола Container
    typealias Item = Int
    mutating func append(item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}


struct Stack<Element>: Container {
    // исходная реализация Stack<Element>
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // удовлетворение требований протокола Container
    mutating func append(item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Array: Container {}

protocol Container {
    associatedtype Item: Equatable
    mutating func append(item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

func allItemsMatch<C1: Container, C2: Container>
    (someContainer: C1, _ anotherContainer: C2) -> Bool
where C1.Item == C2.Item, C1.Item: Equatable {
    // Проверяем одинаковое ли количество элементов находится в контейнерах.
    if someContainer.count != anotherContainer.count {
        return false
    }

    // Проверяем все ли значения попарно равны.
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }

    // Все элементы совпадают, так что возвращаем true.
    return true
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}
// Выведет "All items match.

extension Stack where Element: Equatable {
    func isTop(item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}
// Выведет "Top element is tres.»
