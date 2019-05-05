import Foundation

// Return a bool if there are 2 numbers in the array that equal a sum
let numbers = [1, 3, 6, 7, 7, 12, 14]

// 1. Brute Force - Nested for-loop compare all (n2)
func bruteForce2Sum(array: [Int], sum: Int) -> Bool {
    
    for i in 0..<array.count {
        for j in 0..<array.count where j != i {
            if array[i] + array[j] == sum{
                print("\(array[i]) + \(array[j]) is equal to \(sum)")
                return true
            } else {
                print("\(array[i]) + \(array[j]) is not equal to \(sum)")
            }
        }
    }
    
    print("There is no pair of numbers in array whose sum is equal to \(sum)")
    return false
}

//bruteForce2Sum(array: numbers, sum: 18)

// 2. Binary search for complement if sorted (n log n)
func binarySearchHelper(array: [Int], key: Int) -> Bool {
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex/2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midIndex+1...maxIndex])
        return binarySearchHelper(array: slice, key: key)
    }
    if key < midValue {
        let slice = Array(array[minIndex...midIndex-1])
        return binarySearchHelper(array: slice, key: key)
    }
    if key == midValue {
        return true
    }

    return false
    
}

func binarySearch2Sum(array: [Int], sum: Int) -> Bool {
    for i in 0..<array.count {
        let complement = sum - array[i]
        
        // To ensure that the complement is not the array[i] itself
        var temp = array
        temp.remove(at: i)
        
        // Call binary search on temp to look for complement
        let hasComplement = binarySearchHelper(array: temp, key: complement)
        print("\(array[i]) has complement? - \(hasComplement)")
        if hasComplement == true {
            print("\(array[i]) has a complement \(complement) in array that can satisfy sum of \(sum)")
            return true
        }
    }
    return false
}

//binarySearch2Sum(array: numbers, sum: 8)


// 3. Move pointer from either end - (n)

func pointers2Sum(array:[Int], sum: Int) -> Bool {
    
    var lowIndexPointer = 0
    var highIndexPointer = array.count - 1
    
    while lowIndexPointer < highIndexPointer {
        let sumOfPointers = array[lowIndexPointer] + array[highIndexPointer]
        
        if sumOfPointers == sum {
            print("\(array[lowIndexPointer]) + \(array[highIndexPointer]) is equal to \(sum)")
            return true
        } else if sumOfPointers < sum {
            lowIndexPointer += 1
        } else if sumOfPointers > sum {
            highIndexPointer -= 1
        }
    }
    
    print("There is no pair of numbers in array whose sum is equal to \(sum)")
    return false
}

pointers2Sum(array: numbers, sum: 19)
