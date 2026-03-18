extension Array {
    /// Recursively flattens nested arrays of Any into a single flat [Any].
    public func flattened() -> [Any] {
        reduce(into: [Any]()) { result, element in
            if let subArray = element as? [Any] {
                result.append(contentsOf: subArray.flattened())
            } else {
                result.append(element)
            }
        }
    }

    /// Maps each element through `transform`, omitting nil results (equivalent to compactMap).
    public func compactMapped<T>(_ transform: (Element) -> T?) -> [T] {
        compactMap(transform)
    }
}
