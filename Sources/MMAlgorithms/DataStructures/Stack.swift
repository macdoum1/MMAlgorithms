public class Stack<Element> {
    private var storage: [Element] = []

    public init() {}

    public var count: Int { storage.count }

    public func push(_ element: Element) {
        storage.append(element)
    }

    @discardableResult
    public func pop() -> Element? {
        storage.popLast()
    }

    public func peek() -> Element? {
        storage.last
    }
}
