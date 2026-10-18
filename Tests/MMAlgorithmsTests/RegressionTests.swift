import XCTest
@testable import MMAlgorithms

final class RegressionTests: XCTestCase {
    func testAppendAfterRemovingTail() {
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        XCTAssertTrue(list.remove(2))
        list.append(3)
        XCTAssertEqual(list.values, [1, 3])
    }

    func testStockTradeKeepsBuyBeforeSell() {
        let prices: [Double] = [2, 5, 1]
        let trade = MaximumStockProfit.buySell(prices: prices)
        XCTAssertEqual(trade?.buyIndex, 0)
        XCTAssertEqual(trade?.sellIndex, 1)
    }

    func testLeastAverageDescendingWindow() {
        XCTAssertEqual(SubarrayUtility.subarrayWithLeastAverage(in: [3, 2, 1], size: 2), [2, 1])
    }

    func testEmptyAndSingletonInputs() {
        XCTAssertTrue([Int]().isSorted)
        XCTAssertTrue(BinaryTree<Int>().isValid)
        XCTAssertNil(SubarrayUtility.subarray(of: [], summingTo: 0))
        XCTAssertEqual(SubarrayUtility.lengthOfLongestIncreasingSubarray(in: [7]), 1)
        XCTAssertNil(SubarrayUtility.threeElements(in: [1, 2], summingTo: 3))
        XCTAssertEqual(SubarrayUtility.triplets(from: [1, 2], withSumLessThan: 4), [])
        XCTAssertNil(SubarrayUtility.subarrayWithLeastAverage(in: [1, 2], size: 0))
        XCTAssertNil(SubarrayUtility.subarrayWithLeastAverage(in: [1, 2], size: -1))
    }

    func testHashSearchChecksEqualityDespiteCollisions() {
        struct Colliding: Hashable, Comparable {
            let value: Int
            func hash(into hasher: inout Hasher) { hasher.combine(0) }
            static func < (lhs: Self, rhs: Self) -> Bool { lhs.value < rhs.value }
        }
        let values = [Colliding(value: 1), Colliding(value: 2)]
        XCTAssertEqual(values.search(for: Colliding(value: 1), using: .hash), 0)
        XCTAssertNil(values.search(for: Colliding(value: 3), using: .hash))
    }

    func testGraphDirectednessAndCycleTraversal() {
        let graph = Graph<Int>()
        let a = Vertex(1), b = Vertex(2), c = Vertex(3)
        graph.addEdge(from: a, to: b)
        graph.addEdge(from: b, to: a)
        graph.addEdge(from: a, to: c)
        graph.addEdge(from: b, to: c)
        graph.addEdge(from: c, to: a)
        XCTAssertTrue(graph.isDirected)
        XCTAssertEqual(Set(graph.depthFirst(from: a)), Set([1, 2, 3]))
        XCTAssertEqual(graph.depthFirst(from: a).count, 3)
        XCTAssertEqual(graph.breadthFirst(from: a).count, 3)
    }

    func testStockTradesAgainstSmallReference() {
        let samples: [Double] = [-1, 0, 1, 2]
        for a in samples { for b in samples { for c in samples {
            let prices = [a, b, c]
            let best = max(b - a, c - a, c - b)
            let trade = MaximumStockProfit.buySell(prices: prices)
            if best <= 0 {
                XCTAssertNil(trade)
            } else {
                XCTAssertNotNil(trade)
                if let trade = trade {
                    XCTAssertLessThan(trade.buyIndex, trade.sellIndex)
                    XCTAssertEqual(prices[trade.sellIndex] - prices[trade.buyIndex], best)
                }
            }
        } } }
    }

    func testLeastAverageAgainstSmallReference() {
        let samples = [-2, 0, 3]
        for a in samples { for b in samples { for c in samples {
            let values = [a, b, c]
            let expected = a + b <= b + c ? [a, b] : [b, c]
            XCTAssertEqual(SubarrayUtility.subarrayWithLeastAverage(in: values, size: 2), expected)
        } } }
    }

    func testTripletsIncludeEveryIndexCombination() {
        let result = SubarrayUtility.triplets(from: [1, 2, 3, 4], withSumLessThan: 9)
        XCTAssertEqual(result, [[1, 2, 3], [1, 2, 4], [1, 3, 4]])
    }

    func testBucketSortHandlesWideIntegerRange() {
        let values = [Int.max, Int.min, 0, Int.min]
        XCTAssertEqual(values.bucketSort(), values.sorted())
    }

    func testDivisionHandlesMinimumInteger() throws {
        XCTAssertEqual(try Int.divide(Int.min, by: 2), Int.min / 2)
        XCTAssertEqual(try Int.divide(Int.min, by: Int.min), 1)
        XCTAssertThrowsError(try Int.divide(Int.min, by: -1))
    }

    func testTreeAllowsDuplicateValuesOnRight() {
        let tree = BinaryTree<Int>()
        tree.insert(2)
        tree.insert(2)
        XCTAssertTrue(tree.isValid)
        XCTAssertEqual(tree.inOrder(), [2, 2])
    }

    func testDivisionAgainstSmallReference() throws {
        for numerator in -12...12 {
            for denominator in -5...5 where denominator != 0 {
                XCTAssertEqual(try Int.divide(numerator, by: denominator), numerator / denominator)
            }
        }
    }

    func testLinkedListHeadTailAndDuplicateTransitions() {
        let list = LinkedList<Int>()
        XCTAssertFalse(list.remove(1))
        list.append(1)
        XCTAssertTrue(list.remove(1))
        list.append(2)
        list.append(2)
        XCTAssertTrue(list.remove(2))
        list.append(3)
        XCTAssertEqual(list.values, [2, 3])
        XCTAssertTrue(list.remove(3))
        list.append(4)
        XCTAssertEqual(list.values, [2, 4])
    }
}
