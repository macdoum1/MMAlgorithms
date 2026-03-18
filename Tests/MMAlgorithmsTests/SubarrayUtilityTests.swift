import XCTest
@testable import MMAlgorithms

final class SubarrayUtilityTests: XCTestCase {

    // MARK: - Subarray with sum

    func testSubarrayLengthOne() {
        XCTAssertEqual(SubarrayUtility.subarray(of: [2, 15, 2, 3, 100], summingTo: 15), [15])
    }

    func testSubarrayLengthTwo() {
        XCTAssertEqual(SubarrayUtility.subarray(of: [2, 15, 2, 3, 100], summingTo: 5), [2, 3])
    }

    func testSubarrayLengthThree() {
        XCTAssertEqual(SubarrayUtility.subarray(of: [2, 15, 2, 3, 100], summingTo: 105), [2, 3, 100])
    }

    func testNoSubarrayWithSum() {
        XCTAssertNil(SubarrayUtility.subarray(of: [2, 15, 2, 3, 100], summingTo: 18))
    }

    // MARK: - Longest increasing subarray

    func testLengthOfLongestIncreasingSubarray() {
        let length = SubarrayUtility.lengthOfLongestIncreasingSubarray(in: [4, 1, 3, 2, 100, 101, 102, 103, 89])
        XCTAssertEqual(length, 5)
    }

    func testLongestIncreasingSubarray() {
        let result = SubarrayUtility.longestIncreasingSubarray(in: [4, 1, 3, 2, 100, 101, 102, 103, 89, 1, 2, 3])
        XCTAssertEqual(result, [2, 100, 101, 102, 103])
    }

    // MARK: - Three elements summing to target

    func testThreeElementsWhoseSumTotals() {
        let result = SubarrayUtility.threeElements(in: [-1, 3, 11, -10, 5], summingTo: 0)!
        XCTAssertEqual(Set(result), Set([-1, 11, -10]))
    }

    // MARK: - Subarray with least average

    func testSubarrayWithLeastAverage() {
        let result = SubarrayUtility.subarrayWithLeastAverage(in: [1, 10, 11, 50, 2, 3, 14], size: 3)
        XCTAssertEqual(result, [2, 3, 14])
    }

    // MARK: - Triplets with sum less than

    func testTripletsWithSumLessThan() {
        let result = SubarrayUtility.triplets(from: [1, 2, 1, 3, 10, 3], withSumLessThan: 7)
        XCTAssertEqual(result, [[1, 1, 3], [1, 2, 3], [1, 2, 3]])
    }

    // MARK: - Pairs with sum

    func testPairsWithSum() {
        let result = SubarrayUtility.allPairs(from: [5, 5, 3, 100, 7, 3], summingTo: 10, useDictionary: false)
        XCTAssertEqual(result, [[3, 7], [3, 7], [5, 5]])
    }

    func testPairsWithSumUsingDictionary() {
        let result = SubarrayUtility.allPairs(from: [5, 5, 3, 100, 7, 3], summingTo: 10, useDictionary: true)
        XCTAssertEqual(result.count, 2)
        XCTAssertTrue(result.contains([5, 5]))
        XCTAssertTrue(result.contains([3, 7]))
    }
}
