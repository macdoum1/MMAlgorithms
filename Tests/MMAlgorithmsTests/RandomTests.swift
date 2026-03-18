import XCTest
@testable import MMAlgorithms

final class RandomTests: XCTestCase {

    // MARK: - Random Int

    func testRandomIntWithDifferingBounds() {
        let n = Int.randomInt(between: 1, and: 5)
        XCTAssertTrue(n >= 1 && n <= 5)
    }

    func testRandomIntWithSameBounds() {
        XCTAssertEqual(Int.randomInt(between: 5, and: 5), 5)
    }

    func testRandomIntZero() {
        XCTAssertEqual(Int.randomInt(between: 0, and: 0), 0)
    }

    func testRandomIntNegativeBounds() {
        let n = Int.randomInt(between: -10, and: -3)
        XCTAssertTrue(n >= -10 && n <= -3)
    }

    // MARK: - Random Array

    func testRandomArraySize() {
        let array = [Int].randomIntArray(size: 100, between: 1, and: 100)
        XCTAssertEqual(array.count, 100)
    }

    func testRandomArraySizeWithZeroValueRange() {
        let array = [Int].randomIntArray(size: 100, between: 0, and: 0)
        XCTAssertEqual(array.count, 100)
    }
}
