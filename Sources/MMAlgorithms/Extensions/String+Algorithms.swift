// MARK: - Run-length compression (from MMAlgorithms)

extension String {
    /// Compresses consecutive runs of characters: "aaabbccdddd" → "a3b2c2d4"
    public func compressed() -> String {
        var result = ""
        var i = startIndex
        while i < endIndex {
            let current = self[i]
            var count = 1
            var j = index(after: i)
            while j < endIndex && self[j] == current {
                count += 1
                j = index(after: j)
            }
            result += count > 1 ? "\(current)\(count)" : "\(current)"
            i = j
        }
        return result
    }
}

// MARK: - HandyAlgs (from NSString-HandyAlgs)

extension String {
    /// Reverses the order of words split by `delimiter`.
    public func reversedWords(delimiter: String) -> String {
        components(separatedBy: delimiter).reversed().joined(separator: delimiter)
    }

    /// Returns true if the string reads the same forwards and backwards (case-insensitive).
    public var isPalindrome: Bool {
        lowercased() == String(lowercased().reversed())
    }

    /// Returns a palindrome formed by inserting the fewest characters possible into the string.
    /// Uses dynamic programming (O(n²) time and space).
    public func palindromeWithMinInsertions() -> String {
        let chars = Array(self)
        let n = chars.count
        guard n > 1 else { return self }

        // dp[i][j] = min insertions to make chars[i...j] a palindrome
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for length in 2...n {
            for i in 0...(n - length) {
                let j = i + length - 1
                dp[i][j] = chars[i] == chars[j]
                    ? dp[i + 1][j - 1]
                    : min(dp[i + 1][j], dp[i][j - 1]) + 1
            }
        }

        // Reconstruct the palindrome from the DP table
        var left: [Character] = []
        var right: [Character] = []
        var i = 0, j = n - 1
        while i < j {
            if chars[i] == chars[j] {
                left.append(chars[i])
                right.append(chars[j])
                i += 1; j -= 1
            } else if dp[i + 1][j] <= dp[i][j - 1] {
                left.append(chars[i])
                right.append(chars[i])
                i += 1
            } else {
                left.append(chars[j])
                right.append(chars[j])
                j -= 1
            }
        }
        if i == j { left.append(chars[i]) }
        return String(left + right.reversed())
    }

    /// Returns true if this string is a rotation of `other` (case-insensitive).
    public func isRotation(of other: String) -> Bool {
        guard count == other.count else { return false }
        return (lowercased() + lowercased()).contains(other.lowercased())
    }

    /// Returns true if this string is an anagram of `other` (case-insensitive).
    public func isAnagram(of other: String) -> Bool {
        guard count == other.count else { return false }
        return lowercased().sorted() == other.lowercased().sorted()
    }

    /// Splits the string into an array of single-character strings.
    public var characterStrings: [String] {
        map { String($0) }
    }

    /// Returns the first character that appears exactly once, in order.
    public var firstNonRepeated: Character? {
        var counts: [Character: Int] = [:]
        for c in self { counts[c, default: 0] += 1 }
        return first { counts[$0] == 1 }
    }

    /// Returns true if every opening parenthesis has a matching closing parenthesis.
    public var hasCorrectParentheses: Bool {
        var stack = 0
        for c in self {
            if c == "(" { stack += 1 }
            else if c == ")" {
                if stack == 0 { return false }
                stack -= 1
            }
        }
        return stack == 0
    }

    /// Returns true if the string is a correctly spelled English word.
    public var isInDictionary: Bool {
        isDictionaryWord(self)
    }
}

// MARK: - Platform-specific spell checking

#if canImport(UIKit)
import UIKit
private func isDictionaryWord(_ word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(word.startIndex..., in: word)
    let misspelled = checker.rangeOfMisspelledWord(
        in: word, range: range, startingAt: 0, wrap: false, language: "en"
    )
    return misspelled.location == NSNotFound
}
#elseif canImport(AppKit)
import AppKit
private func isDictionaryWord(_ word: String) -> Bool {
    let checker = NSSpellChecker.shared
    let range = checker.checkSpelling(of: word, startingAt: 0)
    return range.location == NSNotFound
}
#else
private func isDictionaryWord(_ word: String) -> Bool { false }
#endif
