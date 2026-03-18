import XCTest
@testable import MMAlgorithms

/*
       8
      / \
     3   11
      \    \
       7   100
*/

final class BinaryTreeTests: XCTestCase {

    private func makeTree(_ values: [Int]) -> BinaryTree<Int> {
        let tree = BinaryTree<Int>()
        values.forEach { tree.insert($0) }
        return tree
    }

    func testInOrderTraversal() {
        let tree = makeTree([8, 3, 11, 7, 100])
        XCTAssertEqual(tree.inOrder(), [3, 7, 8, 11, 100])
    }

    func testPreOrderTraversal() {
        let tree = makeTree([8, 3, 11, 7, 100])
        XCTAssertEqual(tree.preOrder(), [8, 3, 7, 11, 100])
    }

    func testPostOrderTraversal() {
        let tree = makeTree([8, 3, 11, 7, 100])
        XCTAssertEqual(tree.postOrder(), [7, 3, 100, 11, 8])
    }

    func testIsValidBinaryTree() {
        let tree = makeTree([8, 3, 11, 7, 100])
        XCTAssertTrue(tree.isValid)
    }

    func testIterateToLevel() {
        let tree = makeTree([10, 7, 12, 6, 8, 11, 13])
        XCTAssertEqual(tree.values(atLevel: 2), [6, 8, 11, 13])
    }

    func testValuesByLevel() {
        let tree = makeTree([10, 7, 12, 6, 8, 11, 13, 9])
        XCTAssertEqual(tree.valuesByLevel(), [[10], [7, 12], [6, 8, 11, 13], [9]])
    }

    func testTreeIsComplete() {
        let tree = makeTree([5, 3, 7, 1, 4, 6, 8])
        XCTAssertTrue(tree.isComplete)
    }

    func testTreeIsCompleteVariantTwo() {
        let tree = makeTree([5, 3, 7, 1, 4, 6])
        XCTAssertTrue(tree.isComplete)
    }

    func testTreeIsNotComplete() {
        let tree = makeTree([5, 3, 7, 4, 6, 8])
        XCTAssertFalse(tree.isComplete)
    }

    func testLevelOrder() {
        let tree = makeTree([5, 3, 7, 1, 4, 6, 8])
        XCTAssertEqual(tree.levelOrder(), [[5], [3, 7], [1, 4, 6, 8]])
    }

    func testIntegerAverageOfEachLevel() {
        let tree = makeTree([5, 3, 7, 1, 4, 6, 8])
        XCTAssertEqual(tree.averagesByLevel(), [5, 5, 4])
    }

    func testTreeMap() {
        let tree = makeTree([5, 3, 7, 1, 4, 6, 8])
        tree.transform { $0 * 2 }
        XCTAssertEqual(tree.inOrder(), [2, 6, 8, 10, 12, 14, 16])
    }
}
