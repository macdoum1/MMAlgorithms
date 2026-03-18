public enum SearchType {
    case iterator, binary, hash
}

extension Array where Element: Comparable & Hashable {
    /// Searches for `element` using the specified algorithm. Returns the index or nil.
    public func search(for element: Element, using type: SearchType) -> Int? {
        switch type {
        case .iterator: return iteratorSearch(for: element)
        case .binary:   return binarySearch(for: element)
        case .hash:     return hashSearch(for: element)
        }
    }

    // O(n) linear scan
    private func iteratorSearch(for element: Element) -> Int? {
        firstIndex(of: element)
    }

    // O(log n) — requires a sorted array
    private func binarySearch(for element: Element) -> Int? {
        binarySearch(for: element, min: 0, max: count - 1)
    }

    private func binarySearch(for element: Element, min: Int, max: Int) -> Int? {
        guard max >= min else { return nil }
        let mid = (min + max) / 2
        if self[mid] == element { return mid }
        if element < self[mid] { return binarySearch(for: element, min: min, max: mid - 1) }
        return binarySearch(for: element, min: mid + 1, max: max)
    }

    // O(n) build + O(1) lookup via hash
    private func hashSearch(for element: Element) -> Int? {
        var map: [Int: Int] = [:]
        for (idx, obj) in enumerated() {
            map[obj.hashValue] = idx
        }
        return map[element.hashValue]
    }
}
