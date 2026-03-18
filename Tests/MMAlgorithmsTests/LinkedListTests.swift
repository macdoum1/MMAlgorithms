import XCTest
@testable import MMAlgorithms

final class LinkedListTests: XCTestCase {
    func testAddValue() {
        let list = LinkedList<Int>()
        list.append(1); list.append(2); list.append(3)
        XCTAssertEqual(list.values, [1, 2, 3])
    }

    func testFindValuePresent() {
        let list = LinkedList<Int>()
        list.append(1); list.append(2); list.append(3)
        XCTAssertTrue(list.contains(3))
    }

    func testFindValueAbsent() {
        let list = LinkedList<Int>()
        list.append(1); list.append(2); list.append(3)
        XCTAssertFalse(list.contains(4))
    }

    func testRemoveHeadValue() {
        let list = LinkedList<Int>()
        list.append(1); list.append(2); list.append(3)
        XCTAssertTrue(list.remove(1))
        XCTAssertEqual(list.values, [2, 3])
    }

    func testRemoveMiddleValue() {
        let list = LinkedList<Int>()
        list.append(1); list.append(2); list.append(3)
        XCTAssertTrue(list.remove(2))
        XCTAssertEqual(list.values, [1, 3])
    }

    func testRemoveTailValue() {
        let list = LinkedList<Int>()
        list.append(1); list.append(2); list.append(3)
        XCTAssertTrue(list.remove(3))
        XCTAssertEqual(list.values, [1, 2])
    }

    func testRemoveInvalidValue() {
        let list = LinkedList<Int>()
        list.append(1); list.append(2); list.append(3)
        XCTAssertFalse(list.remove(4))
        XCTAssertEqual(list.values, [1, 2, 3])
    }

    func testReverseIterator() {
        let list = LinkedList<String>()
        list.append("A"); list.append("B"); list.append("C")
        var reversed: [String] = []
        list.forEachReversed { reversed.append($0) }
        XCTAssertEqual(reversed, ["C", "B", "A"])
    }
}
