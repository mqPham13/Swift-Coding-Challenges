import Foundation

func isPalindromePermutaion(word: String) -> Bool {
    
    let word = word.lowercased()
    var oddCharacters : Set<Character> = []
    for char in word where char != " " {
        if oddCharacters.contains(char) {
            oddCharacters.remove(char)
        } else {
            oddCharacters.insert(char)
        }
    }

    return oddCharacters.count <= 1
}

isPalindromePermutaion(word: "ciivc")

isPalindromePermutaion(word: "quang")

isPalindromePermutaion(word: "ci vic")

isPalindromePermutaion(word: "HaNnah")
