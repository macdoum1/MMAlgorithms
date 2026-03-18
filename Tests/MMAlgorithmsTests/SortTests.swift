import XCTest
@testable import MMAlgorithms

final class SortTests: XCTestCase {
    private let unsorted: [Int] = [Int].randomIntArray(size: 15, between: 0, and: 10_000)
    private var reference: [Int] { unsorted.sorted() }

    func testIsSorted() {
        XCTAssertTrue(reference.isSorted)
    }

    func testMergeSort() {
        measure { XCTAssertEqual(unsorted.sorted(using: .merge), reference) }
    }

    func testQuickSort() {
        measure { XCTAssertEqual(unsorted.sorted(using: .quick), reference) }
    }

    func testInsertionSort() {
        measure { XCTAssertEqual(unsorted.sorted(using: .insertion), reference) }
    }

    func testBucketSort() {
        measure { XCTAssertEqual(unsorted.sorted(using: .bucket), reference) }
    }
}
