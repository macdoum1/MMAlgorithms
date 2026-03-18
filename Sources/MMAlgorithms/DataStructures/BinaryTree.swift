public class BinaryTree<Value: Comparable> {
    class Node {
        var value: Value
        var left: Node?
        var right: Node?

        init(_ value: Value) { self.value = value }

        func insert(_ node: Node) {
            if node.value < value {
                left == nil ? (left = node) : left!.insert(node)
            } else {
                right == nil ? (right = node) : right!.insert(node)
            }
        }
    }

    private var root: Node?

    public init() {}

    public func insert(_ value: Value) {
        let node = Node(value)
        if root == nil { root = node } else { root!.insert(node) }
    }

    // MARK: - Traversals

    public func preOrder() -> [Value] {
        preOrderValues(root)
    }

    private func preOrderValues(_ node: Node?) -> [Value] {
        guard let node = node else { return [] }
        return [node.value] + preOrderValues(node.left) + preOrderValues(node.right)
    }

    public func postOrder() -> [Value] {
        postOrderValues(root)
    }

    private func postOrderValues(_ node: Node?) -> [Value] {
        guard let node = node else { return [] }
        return postOrderValues(node.left) + postOrderValues(node.right) + [node.value]
    }

    public func inOrder() -> [Value] {
        inOrderValues(root)
    }

    private func inOrderValues(_ node: Node?) -> [Value] {
        guard let node = node else { return [] }
        return inOrderValues(node.left) + [node.value] + inOrderValues(node.right)
    }

    // MARK: - Validation

    public var isValid: Bool {
        let vals = inOrder()
        for i in 0..<vals.count - 1 {
            if vals[i] >= vals[i + 1] { return false }
        }
        return true
    }

    // MARK: - Level Operations

    public func values(atLevel level: Int) -> [Value] {
        valuesAtLevel(level, node: root, currentLevel: 0)
    }

    private func valuesAtLevel(_ level: Int, node: Node?, currentLevel: Int) -> [Value] {
        guard let node = node else { return [] }
        if level == currentLevel { return [node.value] }
        return valuesAtLevel(level, node: node.left, currentLevel: currentLevel + 1)
             + valuesAtLevel(level, node: node.right, currentLevel: currentLevel + 1)
    }

    public func valuesByLevel() -> [[Value]] {
        var dict: [Int: [Value]] = [:]
        func recurse(_ node: Node?, level: Int) {
            guard let node = node else { return }
            dict[level, default: []].append(node.value)
            recurse(node.left, level: level + 1)
            recurse(node.right, level: level + 1)
        }
        recurse(root, level: 0)
        return dict.keys.sorted().map { dict[$0]! }
    }

    public func levelOrder() -> [[Value]] {
        guard let root = root else { return [] }
        var result: [[Value]] = []
        var currentLevel: [Node] = [root]
        while !currentLevel.isEmpty {
            result.append(currentLevel.map { $0.value })
            currentLevel = currentLevel.flatMap { [$0.left, $0.right].compactMap { $0 } }
        }
        return result
    }

    // MARK: - Completeness

    public var isComplete: Bool {
        guard let root = root else { return true }
        var queue: [Node?] = [root]
        var seenNil = false
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if let node = node {
                if seenNil { return false }
                queue.append(node.left)
                queue.append(node.right)
            } else {
                seenNil = true
            }
        }
        return true
    }

    // MARK: - Mapping

    public func transform(_ transform: (Value) -> Value) {
        func mapNode(_ node: Node?) {
            guard let node = node else { return }
            node.value = transform(node.value)
            mapNode(node.left)
            mapNode(node.right)
        }
        mapNode(root)
    }
}

extension BinaryTree where Value == Int {
    public func averagesByLevel() -> [Int] {
        levelOrder().map { level in level.reduce(0, +) / level.count }
    }
}
