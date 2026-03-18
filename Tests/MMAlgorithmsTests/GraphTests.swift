import XCTest
@testable import MMAlgorithms

/*
    1--(1)--2--(2)--3
            |       |
           (4)     (2)
            |       |
            5--(5)--4--(11)--6
                    |
                   (1)
                    |
                    7
*/

final class GraphTests: XCTestCase {

    func testGraphConstruction() {
        let graph = Graph<Int>()
        let one   = Vertex(1), two  = Vertex(2), three = Vertex(3)
        let four  = Vertex(4), five = Vertex(5), six   = Vertex(6), seven = Vertex(7)
        graph.addEdge(from: one,   to: two,   weight: 1)
        graph.addEdge(from: two,   to: three, weight: 2)
        graph.addEdge(from: two,   to: five,  weight: 4)
        graph.addEdge(from: five,  to: four,  weight: 5)
        graph.addEdge(from: three, to: four,  weight: 2)
        graph.addEdge(from: four,  to: seven, weight: 1)
        graph.addEdge(from: four,  to: six,   weight: 11)
        XCTAssertTrue(true)
    }

    func testIsDirectedGraphWithUndirectedGraph() {
        let graph = Graph<Int>()
        let a = Vertex(1), b = Vertex(2)
        graph.addEdge(from: a, to: b, weight: 1)
        graph.addEdge(from: b, to: a, weight: 1)
        XCTAssertFalse(graph.isDirected)
    }

    func testIsDirectedGraphWithDirectedGraph() {
        let graph = Graph<Int>()
        let a = Vertex(1), b = Vertex(2)
        graph.addEdge(from: a, to: b, weight: 1)
        XCTAssertTrue(graph.isDirected)
    }

    func testPrimMST() {
        let graph = Graph<Int>()
        let one = Vertex(1), two = Vertex(2), three = Vertex(3)
        let four = Vertex(4), five = Vertex(5), six = Vertex(6)

        graph.addEdge(from: one,   to: four,  weight: 5)
        graph.addEdge(from: four,  to: one,   weight: 5)
        graph.addEdge(from: four,  to: six,   weight: 2)
        let sixToFour  = graph.addEdge(from: six,   to: four,  weight: 2)
        graph.addEdge(from: six,   to: five,  weight: 6)
        graph.addEdge(from: five,  to: six,   weight: 6)
        graph.addEdge(from: five,  to: two,   weight: 3)
        let twoToFive  = graph.addEdge(from: two,   to: five,  weight: 3)
        graph.addEdge(from: two,   to: one,   weight: 6)
        graph.addEdge(from: one,   to: two,   weight: 6)
        graph.addEdge(from: three, to: one,   weight: 1)
        let oneToThree = graph.addEdge(from: one,   to: three, weight: 1)
        graph.addEdge(from: three, to: four,  weight: 5)
        graph.addEdge(from: four,  to: three, weight: 5)
        let threeToSix = graph.addEdge(from: three, to: six,   weight: 4)
        graph.addEdge(from: six,   to: three, weight: 4)
        graph.addEdge(from: three, to: five,  weight: 6)
        graph.addEdge(from: five,  to: three, weight: 6)
        let threeToTwo = graph.addEdge(from: three, to: two,   weight: 5)
        graph.addEdge(from: two,   to: three, weight: 5)

        let edges = graph.minimumSpanningTree(from: one)
        XCTAssertEqual(edges, [oneToThree, threeToSix, sixToFour, threeToTwo, twoToFive])
    }

    func testDepthFirstTraversal() {
        let graph = Graph<String>()
        let a = Vertex("A"), b = Vertex("B"), c = Vertex("C")
        let d = Vertex("D"), e = Vertex("E"), f = Vertex("F"), g = Vertex("G")
        graph.addEdge(from: a, to: b)
        graph.addEdge(from: a, to: d)
        graph.addEdge(from: b, to: c)
        graph.addEdge(from: c, to: e)
        graph.addEdge(from: d, to: f)
        graph.addEdge(from: f, to: g)
        XCTAssertEqual(graph.depthFirst(from: a), ["A", "D", "F", "G", "B", "C", "E"])
    }

    func testBreadthFirstTraversal() {
        let graph = Graph<String>()
        let a = Vertex("A"), b = Vertex("B"), c = Vertex("C")
        let d = Vertex("D"), e = Vertex("E"), f = Vertex("F"), g = Vertex("G")
        graph.addEdge(from: a, to: b)
        graph.addEdge(from: a, to: d)
        graph.addEdge(from: b, to: c)
        graph.addEdge(from: c, to: e)
        graph.addEdge(from: d, to: f)
        graph.addEdge(from: f, to: g)
        XCTAssertEqual(graph.breadthFirst(from: a), ["A", "B", "D", "C", "F", "E", "G"])
    }
}
