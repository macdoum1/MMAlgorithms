extension Array where Element: Comparable {
    /// Merges N pre-sorted arrays into one sorted array.
    public static func mergeArrays(_ arrays: [[Element]]) -> [Element] {
        guard arrays.count >= 2 else { return arrays.first ?? [] }
        let left = arrays[arrays.count - 2]
        let right = arrays[arrays.count - 1]
        let merged = mergeSorted(left, right)
        var remaining = [[Element]](arrays.dropLast(2))
        remaining.append(merged)
        return mergeArrays(remaining)
    }

    private static func mergeSorted(_ left: [Element], _ right: [Element]) -> [Element] {
        var result: [Element] = []
        var i = 0, j = 0
        while i < left.count && j < right.count {
            if left[i] < right[j] {
                result.append(left[i]); i += 1
            } else if left[i] > right[j] {
                result.append(right[j]); j += 1
            } else {
                result.append(left[i]); i += 1
                result.append(right[j]); j += 1
            }
        }
        result.append(contentsOf: left[i...])
        result.append(contentsOf: right[j...])
        return result
    }
}
