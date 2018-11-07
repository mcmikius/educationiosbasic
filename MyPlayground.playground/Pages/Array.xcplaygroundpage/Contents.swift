//Course

var array = [10, 1, 2, 3] + [4, 5, 6]
array += [7]
print(array[array.endIndex - 1])

//let sortedArray = array.sorted()
for element in array.sorted().reversed(){
    print(element)
}
//array.insert([4, 5], at: array.endIndex)
