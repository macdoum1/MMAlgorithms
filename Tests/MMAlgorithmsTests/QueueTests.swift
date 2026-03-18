import XCTest
@testable import MMAlgorithms

final class QueueTests: XCTestCase {
    func testPush() {
        let queue = Queue<Int>()
        queue.push(3); queue.push(2); queue.push(1)
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.pop(), 3)
        XCTAssertEqual(queue.pop(), 2)
        XCTAssertEqual(queue.pop(), 1)
    }

    func testPop() {
        let queue = Queue<Int>()
        queue.push(3); queue.push(2); queue.push(1)
        queue.pop()
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.pop(), 2)
        XCTAssertEqual(queue.pop(), 1)
    }

    func testPeek() {
        let queue = Queue<Int>()
        queue.push(3); queue.push(2); queue.push(1)
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.peek(), 3)
        XCTAssertEqual(queue.count, 3)
    }
}
