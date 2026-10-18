// MARK: - Factorial

extension Int {
    /// Recursive n! — O(n) stack depth. Requires n in 0...20 on 64-bit Int.
    public static func factorial(_ n: Int) -> Int {
        n == 0 ? 1 : n * factorial(n - 1)
    }

    /// Iterative n! — O(n) time, O(1) space. Requires n in 0...20 on 64-bit Int.
    public static func factorialIterative(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var result = 1
        for i in 2...n { result *= i }
        return result
    }
}

// MARK: - Division without the / operator

public enum ArithmeticError: Error {
    case divisionByZero
    case overflow
}

extension Int {
    /// Integer division truncated toward zero, without the division operator.
    /// Throws on divide-by-zero or the unrepresentable Int.min / -1 result.
    public static func divide(_ numerator: Int, by denominator: Int) throws -> Int {
        guard denominator != 0 else { throw ArithmeticError.divisionByZero }
        var remaining = numerator.magnitude
        let divisor = denominator.magnitude
        var quotient: UInt = 0
        while remaining >= divisor {
            var chunk = divisor
            var multiple: UInt = 1
            while chunk <= (remaining >> 1) {
                chunk <<= 1
                multiple <<= 1
            }
            remaining -= chunk
            quotient += multiple
        }
        if (numerator < 0) == (denominator < 0) {
            guard quotient <= UInt(Int.max) else { throw ArithmeticError.overflow }
            return Int(quotient)
        }
        if quotient == UInt(Int.max) + 1 { return Int.min }
        return -Int(quotient)
    }
}
