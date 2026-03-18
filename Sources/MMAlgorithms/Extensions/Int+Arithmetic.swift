// MARK: - Factorial

extension Int {
    /// Recursive n! — O(n) stack depth
    public static func factorial(_ n: Int) -> Int {
        n == 0 ? 1 : n * factorial(n - 1)
    }

    /// Iterative n! — O(n) time, O(1) space
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
}

extension Int {
    /// Integer division implemented via repeated subtraction. Throws on divide-by-zero.
    public static func divide(_ numerator: Int, by denominator: Int) throws -> Int {
        guard denominator != 0 else { throw ArithmeticError.divisionByZero }

        var num = numerator
        var den = denominator
        var sign = 1
        if num < 0 { num = -num; sign = -sign }
        if den < 0 { den = -den; sign = -sign }

        var count = 0
        var current = num
        while current >= den {
            current -= den
            count += 1
        }
        return count * sign
    }
}
