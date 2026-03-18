import XCTest
@testable import MMAlgorithms

// Each array represents digits of a number, last element is the ones place.

final class ArrayAdditionTests: XCTestCase {
    // [1, 2, 8] + 2 → [1, 3, 0]
    func testOneCarry() {
        XCTAssertEqual(ArrayAddition.add(2, to: [1, 2, 8]), [1, 3, 0])
    }

    // [1, 8, 8] + 4 → [1, 9, 2]
    func testTwoCarry() {
        XCTAssertEqual(ArrayAddition.add(4, to: [1, 8, 8]), [1, 9, 2])
    }

    // [9, 9, 9] + 1 → [1, 0, 0, 0]
    func testThreeCarry() {
        XCTAssertEqual(ArrayAddition.add(1, to: [9, 9, 9]), [1, 0, 0, 0])
    }

    // [9, 9, 9] + 10000 → [1, 0, 9, 9, 9]
    func testOverCarry() {
        XCTAssertEqual(ArrayAddition.add(10000, to: [9, 9, 9]), [1, 0, 9, 9, 9])
    }
}
