import XCTest
@testable import MMAlgorithms

final class DivisionTests: XCTestCase {
    func testSimpleDivision() throws {
        XCTAssertEqual(try Int.divide(100, by: 5), 20)
    }

    func testNegativeNumerator() throws {
        XCTAssertEqual(try Int.divide(-100, by: 5), -20)
    }

    func testNegativeDenominator() throws {
        XCTAssertEqual(try Int.divide(100, by: -5), -20)
    }

    func testBothNegative() throws {
        XCTAssertEqual(try Int.divide(-100, by: -5), 20)
    }

    func testZeroNumerator() throws {
        XCTAssertEqual(try Int.divide(0, by: 100), 0)
    }

    func testDenominatorOne() throws {
        XCTAssertEqual(try Int.divide(100, by: 1), 100)
    }

    func testUnevenDivision() throws {
        XCTAssertEqual(try Int.divide(20, by: 3), 6)
    }

    func testDivideByZero() {
        XCTAssertThrowsError(try Int.divide(1, by: 0))
    }
}
