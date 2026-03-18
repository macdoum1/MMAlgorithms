public class Queue<Element> {
    private var storage: [Element] = []

    public init() {}

    public var count: Int { storage.count }

    public func push(_ element: Element) {
        storage.append(element)
    }

    @discardableResult
    public func pop() -> Element? {
        guard !storage.isEmpty else { return nil }
        return storage.removeFirst()
    }

    public func peek() -> Element? {
        storage.first
    }
}
