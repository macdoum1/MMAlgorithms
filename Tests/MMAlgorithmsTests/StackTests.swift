import XCTest
@testable import MMAlgorithms

final class StackTests: XCTestCase {
    func testPush() {
        let stack = Stack<Int>()
        stack.push(3); stack.push(2); stack.push(1)
        XCTAssertEqual(stack.count, 3)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 3)
    }

    func testPop() {
        let stack = Stack<Int>()
        stack.push(3); stack.push(2); stack.push(1)
        stack.pop()
        XCTAssertEqual(stack.count, 2)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 3)
    }

    func testPeek() {
        let stack = Stack<Int>()
        stack.push(3); stack.push(2); stack.push(1)
        XCTAssertEqual(stack.count, 3)
        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.count, 3)
    }
}
