// Kotlin-style .let (from Mimik)

extension Optional {
    /// If the optional is non-nil, passes the wrapped value into `action` and returns the result.
    public func letMimik<T>(_ action: (Wrapped) -> T) -> T? {
        map(action)
    }
}
