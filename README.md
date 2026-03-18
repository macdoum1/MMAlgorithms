# MMAlgorithms

A Swift Package containing data structures, algorithms, and functional utilities — consolidated from several learning projects and modernized to idiomatic Swift.

## Contents

### Data Structures

| Type | Description |
|------|-------------|
| `Stack<T>` | LIFO stack — `push`, `pop`, `peek`, `count` |
| `Queue<T>` | FIFO queue — `push`, `pop`, `peek`, `count` |
| `LinkedList<T: Equatable>` | Singly-linked list — `append`, `contains`, `remove`, `values`, `forEachReversed` |
| `BinaryTree<T: Comparable>` | BST — `preOrder()` / `inOrder()` / `postOrder()`, `levelOrder()`, `values(atLevel:)`, `isValid`, `isComplete`, `transform(_:)`, `averagesByLevel()` |
| `Vertex<T>` / `Edge<T>` / `Graph<T>` | Weighted directed/undirected graph — `breadthFirst(from:)`, `depthFirst(from:)`, `minimumSpanningTree(from:)`, `isDirected` |

### Array Extensions

| Extension | Methods |
|-----------|---------|
| `Array+Sort` | `sorted(using:)` — merge, quick, insertion, bucket · `isSorted` |
| `Array+Search` | `search(for:using:)` — iterator, binary, hash |
| `Array+Merge` | `mergeArrays(_:)` — merge N pre-sorted arrays |
| `Array+Functional` | `flattened()` — recursive flatten · `compactMapped(_:)` — compact-map |
| `Array+Random` | `randomIntArray(size:between:and:)` |

### String Extensions

| Extension | Methods |
|-----------|---------|
| `String+Algorithms` | `compressed()` — run-length encoding |
| | `reversedWords(delimiter:)` |
| | `isPalindrome`, `isRotation(of:)`, `isAnagram(of:)` |
| | `characterStrings`, `firstNonRepeated` |
| | `hasCorrectParentheses`, `isInDictionary` |
| | `palindromeWithMinInsertions()` — educational / partial |
| `String+NearbyWords` | `nearbyWords()` — keyboard-adjacency WIP |

### Int Extensions

| Extension | Methods |
|-----------|---------|
| `Int+Arithmetic` | `factorial(_:)` — recursive · `factorialIterative(_:)` — iterative |
| | `divide(_:by:) throws` — division without the `/` operator |
| `Array+Random` | `randomInt(between:and:)` |

### Functional Utilities (Mimik)

Kotlin-inspired operators on `Comparable` and `Optional`:

```swift
20.takeIf { $0 > 10 }       // → 20
20.takeUnless { $0 == 20 }  // → nil

let x: Int? = 1
x.letMimik { $0 + 1 }       // → 2
```

### Utilities

| Type | Description |
|------|-------------|
| `SubarrayUtility` | `subarray(of:summingTo:)` · `longestIncreasingSubarray(in:)` · `threeElements(in:summingTo:)` · `allPairs(from:summingTo:useDictionary:)` · `triplets(from:withSumLessThan:)` · `subarrayWithLeastAverage(in:size:)` |
| `ArrayAddition` | Add an integer to a digit array with carry propagation |
| `MaximumStockProfit` | Find optimal buy/sell indices from a price series |

## Usage

### Swift Package Manager

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/macdoum1/MMAlgorithms.git", from: "1.0.0"),
],
targets: [
    .target(dependencies: ["MMAlgorithms"]),
]
```

Or open `Package.swift` directly in Xcode.

### Requirements

- Swift 5.9+
- macOS 13+ / iOS 16+

## Running Tests

```bash
swift test
```
## License

MIT
