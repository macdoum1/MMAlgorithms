public class LinkedList<Value: Equatable> {
    private class Node {
        var value: Value
        var next: Node?
        init(_ value: Value) { self.value = value }
    }

    private var head: Node?
    private var tail: Node?

    public init() {}

    public func append(_ value: Value) {
        let node = Node(value)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }

    public func contains(_ value: Value) -> Bool {
        var current = head
        while let node = current {
            if node.value == value { return true }
            current = node.next
        }
        return false
    }

    /// Removes the first occurrence of `value`. Returns true if found and removed.
    @discardableResult
    public func remove(_ value: Value) -> Bool {
        var current = head
        var previous: Node?
        while let node = current {
            if node.value == value {
                if node === head {
                    head = node.next
                } else {
                    previous?.next = node.next
                }
                return true
            }
            previous = node
            current = node.next
        }
        return false
    }

    public var values: [Value] {
        var result: [Value] = []
        var current = head
        while let node = current {
            result.append(node.value)
            current = node.next
        }
        return result
    }

    public func forEachReversed(_ action: (Value) -> Void) {
        values.reversed().forEach(action)
    }
}
