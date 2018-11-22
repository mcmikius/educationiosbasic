//Array
func removeNumber(findNumber: Int, array: [Int]) -> [Int]{
    var array = array
    
    for (index, value) in array.enumerate() {
        if value == findNumber{
            array.remove(at: index)
        }
    }
    
    return array
}


func removeNumberWithClosure(findNumber: Int, array: [Int]) -> [Int]{
    return arrayfilte {$0 != findNumber}
}

var array1 = removeNumber(2, array: [1, 2, 3, 4, 5, 6])
var array2 = removeNumberWithClosure(3, array: [1, 2, 3, 4, 5, 6])


var arrayForSort = [1, 15, 45, 65, 2, 35, 5]

func sortArray(array:inout [Int], asc:Bool){
    
    if asc{
        array.sort(by: >)

    }else{
        array.sort(by: <)
    }
}

sortArray(array: &arrayForSort, asc: true)
sortArray(array: &arrayForSort, asc: false)

arrayForSort





var dimArray = [[Int]]()

var numbersCount = 21
var arrayElementsCount = 3

var total = numbersCount / arrayElementsCount // 7

var counter = 0

for n1 in 0..<total { // 7
    
    dimArray.append([])
    
    for _ in 0 ..< arrayElementsCount { // 3
        counter += 1
        dimArray[n1].append(counter)
    }
}

dimArray


//Set

var set1: Set<Int> = [1, 5, 62, 12, 3]

var set2: Set<Int> = [98, 152, 73, 3, 5]

var set3: Set<Int> = [659, 713, 5, 3, 691]


set1.intersection(set2).intersection(set3) // пересечение



/*
 
 2) найдите уникальные элементы (нет в 2-х других) для каждой коллекции
 
 */


var set4: Set<Int> = [1, 2, 4, 3, 5]

var set5: Set<Int> = [1, 6, 4, 3, 2]

var set6: Set<Int> = [5, 4, 3, 2, 8]



set4.subtracting(set5).subtracting(set6) // разность
set5.subtracting(set4).subtracting(set6)
set6.subtracting(set4).subtracting(set5)



//Dictionary

/* создайте функцию, которая получаем 2 параметра: словарь из массива стран (ключ - первая буква, значение - название страны) и функцию печати результата (реализовать через замыкание)
 
 должно получиться примерно так:
 
 countries:
 Я ["Япония"]
 Ш ["Швеция"]
 М ["Молдова", "Мексика"]
 Т ["Турция"]
 К ["Казахстан"]
 А ["Афганистан", "Албания"]
 Г ["Грузия"]
 И ["Иордания", "Испания"]
 
 
 */


// можете добавлять любые свои страны в массив
let countries = [
    "Иордания",
    "Япония",
    "Молдова",
    "Казахстан",
    "Испания",
    "Турция",
    "Мексика",
    "Швеция",
    "Афганистан",
    "Албания",
    "Грузия"]

typealias PrintFunc = (String, [String:[String]]) -> Void // тип для функции печати (замыкание), 1-й параметр - любой текст, 2-й - сам словарь


func sortCountries(countries:[String], printFunc: PrintFunc) -> [String:[String]] {
    
    var newDict: [String : [String]] = [:]
    
    for country in countries {
        
        var firstLetter = String(country.first!) // получаем первую букву
        
        var oldArray = newDict[firstLetter] // пытаемся получить элемент по ключу, может вернуть nil, если такой ключ не будет найден
        
        
        if oldArray != nil{ // ключ не пустой, значит там уже есть значение - массив
            newDict[firstLetter]?.append(country) // добавляем страну в старый массив
            
            //            oldArray?.append(country)// нельзя использовать переменную, т.к. там копия массива (по факту не добавится в массив словаря)
            
            //            print(oldArray)
        }else{ // если же по ключу не было найдено массива - значит это новый массив
            var array = [String]() // создаем пустой массив
            array.append(country); // добавляем страну
            newDict[firstLetter] = array // добавляем новый ключ и в него значение - массив
        }
        
    }
    
    printFunc("countries:", newDict)
    
    return newDict
}



var printFunc: PrintFunc = {
    print($0)
    for (key, value) in $1 {
        print(key, value)
    }
    print()
}


sortCountries(countries: countries, printFunc: printFunc)


