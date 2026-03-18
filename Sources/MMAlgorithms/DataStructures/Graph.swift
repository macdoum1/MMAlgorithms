public class Vertex<Value: Equatable> {
    public let value: Value
    public var adjacentEdges: [Edge<Value>] = []

    public init(_ value: Value) { self.value = value }

    public var description: String { "\(value)" }
}

extension Vertex: Equatable {
    public static func == (lhs: Vertex<Value>, rhs: Vertex<Value>) -> Bool { lhs === rhs }
}

public class Edge<Value: Equatable> {
    public let from: Vertex<Value>
    public let to: Vertex<Value>
    public let weight: Double?

    init(from: Vertex<Value>, to: Vertex<Value>, weight: Double?) {
        self.from = from
        self.to = to
        self.weight = weight
    }

    public var description: String { "From: \(from.value) To: \(to.value)" }
}

extension Edge: Equatable {
    public static func == (lhs: Edge<Value>, rhs: Edge<Value>) -> Bool { lhs === rhs }
}

public class Graph<Value: Equatable> {
    public private(set) var vertices: [Vertex<Value>] = []

    public init() {}

    @discardableResult
    public func addEdge(from: Vertex<Value>, to: Vertex<Value>, weight: Double? = nil) -> Edge<Value> {
        let edge = Edge(from: from, to: to, weight: weight)
        from.adjacentEdges.append(edge)
        if !vertices.contains(where: { $0 === from }) { vertices.append(from) }
        if !vertices.contains(where: { $0 === to }) { vertices.append(to) }
        return edge
    }

    // MARK: - Directed

    public var isDirected: Bool {
        vertices.contains { !hasOppositeEdge(for: $0) }
    }

    private func hasOppositeEdge(for vertex: Vertex<Value>) -> Bool {
        for edge in vertex.adjacentEdges {
            for oppositeEdge in edge.to.adjacentEdges {
                if oppositeEdge.to === vertex { return true }
            }
        }
        return false
    }

    // MARK: - Prim's MST

    public func minimumSpanningTree(from start: Vertex<Value>) -> [Edge<Value>] {
        var edges: [Edge<Value>] = []
        var visited: [Vertex<Value>] = [start]
        while visited.count != vertices.count {
            guard let minEdge = minimumEdge(in: visited) else { break }
            edges.append(minEdge)
            visited.append(minEdge.to)
        }
        return edges
    }

    private func minimumEdge(in visited: [Vertex<Value>]) -> Edge<Value>? {
        var minimum: Edge<Value>?
        for vertex in visited {
            for edge in vertex.adjacentEdges {
                let alreadyVisited = visited.contains { $0 === edge.to }
                guard !alreadyVisited else { continue }
                if minimum == nil {
                    minimum = edge
                } else if let w = edge.weight, let minW = minimum?.weight, w < minW {
                    minimum = edge
                }
            }
        }
        return minimum
    }

    // MARK: - Depth First

    public func depthFirst(from start: Vertex<Value>) -> [Value] {
        var visited: [Vertex<Value>] = []
        let stack = Stack<Vertex<Value>>()
        stack.push(start)
        while stack.count > 0 {
            guard let vertex = stack.pop() else { break }
            visited.append(vertex)
            for edge in vertex.adjacentEdges {
                if !visited.contains(where: { $0 === edge.to }) {
                    stack.push(edge.to)
                }
            }
        }
        return visited.map { $0.value }
    }

    // MARK: - Breadth First

    public func breadthFirst(from start: Vertex<Value>) -> [Value] {
        var visited: [Vertex<Value>] = []
        let queue = Queue<Vertex<Value>>()
        queue.push(start)
        while queue.count > 0 {
            guard let vertex = queue.pop() else { break }
            visited.append(vertex)
            for edge in vertex.adjacentEdges {
                if !visited.contains(where: { $0 === edge.to }) {
                    queue.push(edge.to)
                }
            }
        }
        return visited.map { $0.value }
    }
}
