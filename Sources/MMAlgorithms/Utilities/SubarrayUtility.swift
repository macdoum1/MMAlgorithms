public enum SubarrayUtility {

    // MARK: - Subarray with given sum

    /// Returns the first contiguous subarray whose elements sum to `target`, or nil.
    public static func subarray(of array: [Int], summingTo target: Int) -> [Int]? {
        for windowSize in 1...array.count {
            let windowCount = array.count - windowSize + 1
            for start in 0..<windowCount {
                let window = Array(array[start..<start + windowSize])
                if window.reduce(0, +) == target { return window }
            }
        }
        return nil
    }

    // MARK: - Longest increasing subarray

    /// Returns the length of the longest strictly-increasing contiguous subarray.
    public static func lengthOfLongestIncreasingSubarray(in array: [Int]) -> Int {
        guard !array.isEmpty else { return 0 }
        var maxLength = Int.min
        var previous = array[0]
        var current = 1
        for i in 1..<array.count {
            if array[i] > previous { current += 1 } else { current = 1 }
            previous = array[i]
            if current > maxLength { maxLength = current }
        }
        return maxLength
    }

    /// Returns the longest strictly-increasing contiguous subarray.
    public static func longestIncreasingSubarray(in array: [Int]) -> [Int] {
        guard !array.isEmpty else { return [] }
        var maxLength = 1
        var startIndex = 0
        var currentLength = 1
        var previous = array[0]
        for i in 1..<array.count {
            if array[i] > previous { currentLength += 1 } else { currentLength = 1 }
            if currentLength > maxLength {
                maxLength = currentLength
                startIndex = i - maxLength + 1
            }
            previous = array[i]
        }
        return Array(array[startIndex..<startIndex + maxLength])
    }

    // MARK: - Three elements summing to target

    /// Returns three elements from `array` whose sum equals `target`, or nil.
    public static func threeElements(in array: [Int], summingTo target: Int) -> [Int]? {
        let sorted = array.quickSort()
        for i in 0..<sorted.count - 2 {
            var left = i + 1
            var right = sorted.count - 1
            while left < right {
                let sum = sorted[i] + sorted[left] + sorted[right]
                if sum == target { return [sorted[i], sorted[left], sorted[right]] }
                if sum < target { left += 1 } else { right -= 1 }
            }
        }
        return nil
    }

    // MARK: - Subarray with least average

    /// Returns the contiguous subarray of `size` elements with the smallest average.
    public static func subarrayWithLeastAverage(in array: [Int], size: Int) -> [Int]? {
        guard array.count >= size else { return nil }
        var leastSum = array[0..<size].reduce(0, +)
        var startIndex = 0
        var currentSum = leastSum
        for i in size..<array.count {
            currentSum += array[i] - array[i - 1]
            if currentSum < leastSum {
                leastSum = currentSum
                startIndex = i
            }
        }
        return Array(array[startIndex..<startIndex + size])
    }

    // MARK: - Triplets with sum less than

    /// Returns all triplets from `array` whose sum is strictly less than `limit`.
    public static func triplets(from array: [Int], withSumLessThan limit: Int) -> [[Int]] {
        let sorted = array.quickSort()
        var result: [[Int]] = []
        for i in 0..<sorted.count - 2 {
            var left = i + 1
            var right = sorted.count - 1
            while left < right {
                let sum = sorted[i] + sorted[left] + sorted[right]
                if sum < limit {
                    result.append([sorted[i], sorted[left], sorted[right]])
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return result
    }

    // MARK: - All pairs with given sum

    /// Returns all pairs from `array` whose sum equals `target`.
    /// - Parameter useDictionary: if true uses a hash-map approach (WIP — may produce duplicates).
    public static func allPairs(from array: [Int], summingTo target: Int, useDictionary: Bool) -> [[Int]] {
        if useDictionary {
            // WIP: builds a lookup map, may produce duplicates
            var dict: [Int: Int] = [:]
            for number in array {
                dict[target - number] = number
            }
            var pairs: [[Int]] = []
            for number in array {
                if let other = dict[number] {
                    pairs.append([number, other])
                }
            }
            return pairs
        } else {
            let sorted = array.quickSort()
            var pairs: [[Int]] = []
            var left = 0, right = sorted.count - 1
            while left < right {
                let sum = sorted[left] + sorted[right]
                if sum > target { right -= 1 }
                else {
                    if sum == target { pairs.append([sorted[left], sorted[right]]) }
                    left += 1
                }
            }
            return pairs
        }
    }
}
