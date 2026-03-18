import XCTest
@testable import MMAlgorithms

final class MergeArraysTests: XCTestCase {
    func testMergeArrays() {
        let arrays = [[1, 2, 3], [1, 4, 6], [4, 10, 20]]
        let merged = [Int].mergeArrays(arrays)
        XCTAssertEqual(merged, [1, 1, 2, 3, 4, 4, 6, 10, 20])
    }
}
