import XCTest
@testable import MMAlgorithms

final class FactorialTests: XCTestCase {

    // MARK: - Recursive

    func testFourFactorial() {
        XCTAssertEqual(Int.factorial(4), 24)
    }

    // MARK: - Iterative

    func testIterativeOneFactorial() {
        XCTAssertEqual(Int.factorialIterative(1), 1)
    }

    func testIterativeTwoFactorial() {
        XCTAssertEqual(Int.factorialIterative(2), 2)
    }

    func testIterativeThreeFactorial() {
        XCTAssertEqual(Int.factorialIterative(3), 6)
    }

    func testIterativeFourFactorial() {
        XCTAssertEqual(Int.factorialIterative(4), 24)
    }
}
