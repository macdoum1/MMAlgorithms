import XCTest
@testable import MMAlgorithms

final class SearchTests: XCTestCase {
    private let count = 10_000
    private let target = 5_000
    private lazy var array: [Int] = Array(1...count)

    func testIteratorSearch() {
        measure { XCTAssertEqual(array.search(for: target, using: .iterator), target - 1) }
    }

    func testBinarySearch() {
        measure { XCTAssertEqual(array.search(for: target, using: .binary), target - 1) }
    }

    func testHashSearch() {
        measure { XCTAssertEqual(array.search(for: target, using: .hash), target - 1) }
    }
}
