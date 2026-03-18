/// Adds an integer to an array of digits (base-10), handling carries.
/// Example: [1, 2, 8] + 2 → [1, 3, 0]
public enum ArrayAddition {
    private static let base = 10

    public static func add(_ integer: Int, to array: [Int]) -> [Int] {
        let lastColSum = (array.last ?? 0) + integer
        if lastColSum < base {
            if array.isEmpty { return [lastColSum] }
            var result = array
            result[result.count - 1] = lastColSum
            return result
        }
        let lastColVal = lastColSum % base
        let carry = (lastColSum - lastColVal) / base
        let prefix = array.isEmpty ? [] : Array(array.dropLast())
        var result = add(carry, to: prefix)
        result.append(lastColVal)
        return result
    }
}
