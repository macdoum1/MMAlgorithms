// Kotlin-style takeIf / takeUnless (from Mimik)

extension Comparable {
    /// Returns self if `condition` is true, otherwise nil.
    public func takeIf(_ condition: (Self) -> Bool) -> Self? {
        condition(self) ? self : nil
    }

    /// Returns self if `condition` is false, otherwise nil.
    public func takeUnless(_ condition: (Self) -> Bool) -> Self? {
        takeIf { !condition($0) }
    }
}
