import Foundation

// Merge Sort has the complexity of O(n*log(n))
// The array can be halves -> log(n) times
// The entire array has to be iterated through to merge -> n times

// Split the array
func mergeSort(array: [Int]) -> [Int] {
    // Make sure that the array
    guard array.count > 1 else { return array }
    
    let leftArray = Array(array[0..<array.count/2])
    let rightArray = Array(array[array.count/2..<array.count])
    
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}



// Merge the array
func merge(left: [Int], right: [Int])  -> [Int] {
    
    var mergedArray:[Int] = []
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        } else {
            mergedArray.append(right.removeFirst())
        }
    }
    
    // Append left-over values into mergedArray, left and right are already sorted
    return mergedArray + left + right
}

var numbers:[Int] = []
for _ in 0..<50 {
    let randInt = Int(arc4random_uniform(UInt32(1000)))
    numbers.append(randInt)
}
// Before sorting
print(numbers, "\n")

// After sorting
print(mergeSort(array: numbers))
