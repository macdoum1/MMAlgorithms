extension Array where Element == Int {
    /// Returns an array of `size` random integers in the range [from, to].
    public static func randomIntArray(size: Int, between from: Int, and to: Int) -> [Int] {
        (0..<size).map { _ in Int.randomInt(between: from, and: to) }
    }
}

extension Int {
    /// Returns a random integer in the range [from, to].
    public static func randomInt(between from: Int, and to: Int) -> Int {
        Int.random(in: from...to)
    }
}
