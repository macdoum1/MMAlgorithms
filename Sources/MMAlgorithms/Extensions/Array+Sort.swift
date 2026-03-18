public enum SortType {
    case merge, quick, insertion, bucket
}

// MARK: - Comparable sorts (merge, quick, insertion)

extension Array where Element: Comparable {
    public var isSorted: Bool {
        for i in 0..<count - 1 {
            if self[i] > self[i + 1] { return false }
        }
        return true
    }

    public func mergeSort() -> [Element] {
        guard count >= 2 else { return self }
        let mid = count / 2
        return merging(left: Array(self[..<mid]).mergeSort(),
                       right: Array(self[mid...]).mergeSort())
    }

    private func merging(left: [Element], right: [Element]) -> [Element] {
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

    public func quickSort() -> [Element] {
        guard count > 1 else { return self }
        let pivotIdx = Int.random(in: 0..<count)
        let pivot = self[pivotIdx]
        var less: [Element] = []
        var greater: [Element] = []
        for (idx, element) in enumerated() {
            if element < pivot { less.append(element) }
            else if idx != pivotIdx { greater.append(element) }
        }
        return less.quickSort() + [pivot] + greater.quickSort()
    }

    public func insertionSort() -> [Element] {
        var array = self
        for i in 1..<array.count {
            var j = i
            let target = array[i]
            while j > 0 && target < array[j - 1] {
                array.swapAt(j, j - 1)
                j -= 1
            }
        }
        return array
    }
}

// MARK: - Integer sorts (all four types including bucket)

extension Array where Element: FixedWidthInteger {
    public func sorted(using type: SortType) -> [Element] {
        switch type {
        case .merge:     return mergeSort()
        case .quick:     return quickSort()
        case .insertion: return insertionSort()
        case .bucket:    return bucketSort()
        }
    }

    public func bucketSort() -> [Element] {
        guard !isEmpty else { return [] }
        let minValue = self.min()!
        let maxValue = self.max()!
        let numBuckets = Int(maxValue - minValue) + 1
        var buckets = [[Element]](repeating: [], count: numBuckets)
        for element in self {
            buckets[Int(element - minValue)].append(element)
        }
        return buckets.flatMap { $0 }
    }
}
