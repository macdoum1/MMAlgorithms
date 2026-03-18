import XCTest
@testable import MMAlgorithms

final class FunctionalTests: XCTestCase {

    // MARK: - flatten

    func testFlattenOneDimensional() {
        let array: [Any] = [1, 2, 3]
        XCTAssertEqual(array.flattened() as! [Int], [1, 2, 3])
    }

    func testFlattenTwoDimensional() {
        let array: [Any] = [[1], [2], [3]]
        XCTAssertEqual(array.flattened() as! [Int], [1, 2, 3])
    }

    func testFlattenMixed() {
        let array: [Any] = [1, [2], [[3]]]
        XCTAssertEqual(array.flattened() as! [Int], [1, 2, 3])
    }

    // MARK: - compactMapped

    func testCompactMappedAddition() {
        let result = [1, 2, 3].compactMapped { $0 + 1 }
        XCTAssertEqual(result, [2, 3, 4])
    }

    func testCompactMappedNilReturns() {
        let result: [Int] = [1, 2, 3].compactMapped { _ -> Int? in nil }
        XCTAssertEqual(result.count, 0)
    }
}
