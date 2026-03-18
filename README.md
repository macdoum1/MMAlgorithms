# MMAlgorithms

A Swift Package containing data structures, algorithms, and functional utilities — modernized to idiomatic Swift.

## Contents

- [Data Structures](#data-structures)
- [Array Extensions](#array-extensions)
- [String Extensions](#string-extensions)
- [Int Extensions](#int-extensions)
- [Functional Utilities (Mimik)](#functional-utilities-mimik)
- [Utilities](#utilities)

---

## Data Structures

### Stack\<T\>

LIFO (last-in, first-out) stack backed by an array.

| Method / Property | Description |
|---|---|
| `push(_ element: T)` | Pushes an element onto the top of the stack. |
| `pop() -> T?` | Removes and returns the top element, or `nil` if empty. |
| `peek() -> T?` | Returns the top element without removing it, or `nil` if empty. |
| `count: Int` | The number of elements currently in the stack. |

### Queue\<T\>

FIFO (first-in, first-out) queue backed by an array.

| Method / Property | Description |
|---|---|
| `push(_ element: T)` | Enqueues an element at the back. |
| `pop() -> T?` | Dequeues and returns the front element, or `nil` if empty. |
| `peek() -> T?` | Returns the front element without removing it, or `nil` if empty. |
| `count: Int` | The number of elements currently in the queue. |

### LinkedList\<T: Equatable\>

Singly-linked list with O(1) append and O(n) search and removal.

| Method / Property | Description |
|---|---|
| `append(_ value: T)` | Appends a value to the tail of the list. |
| `contains(_ value: T) -> Bool` | Returns `true` if the list contains `value`. |
| `remove(_ value: T) -> Bool` | Removes the first occurrence of `value`. Returns `true` if found and removed. |
| `values: [T]` | All values in the list, from head to tail. |
| `forEachReversed(_ action: (T) -> Void)` | Calls `action` on each element from tail to head. |

### BinaryTree\<T: Comparable\>

Binary search tree with standard traversals and level-order operations.

| Method / Property | Description |
|---|---|
| `insert(_ value: T)` | Inserts a value into the BST at the correct position. |
| `inOrder() -> [T]` | In-order (left, root, right) traversal — returns values in ascending order for a valid BST. |
| `preOrder() -> [T]` | Pre-order (root, left, right) traversal. |
| `postOrder() -> [T]` | Post-order (left, right, root) traversal. |
| `levelOrder() -> [[T]]` | BFS traversal returning values grouped by level. |
| `valuesByLevel() -> [[T]]` | Returns values grouped by depth. Equivalent to `levelOrder()`. |
| `values(atLevel: Int) -> [T]` | Returns all values at a specific depth level (0-indexed). |
| `isValid: Bool` | Returns `true` if the tree satisfies the BST property at every node. |
| `isComplete: Bool` | Returns `true` if every level is fully filled except possibly the last, which is filled left to right. |
| `transform(_ transform: (T) -> T)` | Applies `transform` to every node value in place. |
| `averagesByLevel() -> [Int]` | *(T == Int only)* Returns the integer average of node values at each level. |

### Graph\<T: Equatable\> / Vertex\<T\> / Edge\<T\>

Weighted directed or undirected graph represented as an adjacency list.

| Method / Property | Description |
|---|---|
| `addEdge(from:to:weight:) -> Edge<T>` | Adds a directed edge between two vertices with an optional weight. Registers new vertices automatically. |
| `isDirected: Bool` | Returns `true` if any vertex lacks a reciprocal edge — i.e., the graph has at least one directed-only edge. |
| `breadthFirst(from:) -> [T]` | BFS traversal from `start`. Returns visited values in breadth-first order. |
| `depthFirst(from:) -> [T]` | DFS traversal from `start`. Returns visited values in depth-first order. |
| `minimumSpanningTree(from:) -> [Edge<T>]` | Prim's algorithm — returns the minimum-weight spanning tree edges. Requires a connected, undirected, weighted graph. |

---

## Array Extensions

### Array+Sort

Sorting algorithms on arrays.

| Method / Property | Description |
|---|---|
| `sorted(using: SortType) -> [T]` | Returns a sorted copy using the specified algorithm (`.merge`, `.quick`, `.insertion`, `.bucket`). Available when `T: FixedWidthInteger`. |
| `mergeSort() -> [T]` | Merge sort. Stable, O(n log n) time. |
| `quickSort() -> [T]` | Quick sort with random pivot. O(n log n) average time. |
| `insertionSort() -> [T]` | Insertion sort. O(n²), but efficient for small or nearly-sorted arrays. |
| `bucketSort() -> [T]` | Bucket sort. O(n + k) for integer arrays where k is the value range. Available when `T: FixedWidthInteger`. |
| `isSorted: Bool` | Returns `true` if the array is in non-descending order. |

### Array+Search

Search algorithms on arrays.

| Method / Property | Description |
|---|---|
| `search(for:using:) -> Int?` | Returns the index of `element` using the specified algorithm, or `nil` if not found. Options: `.iterator` (O(n) linear scan), `.binary` (O(log n), requires sorted array), `.hash` (O(1) average lookup via hash map). |

### Array+Merge

Merging pre-sorted arrays.

| Method / Property | Description |
|---|---|
| `mergeArrays(_ arrays: [[Element]]) -> [Element]` | Merges N pre-sorted arrays into a single sorted array using repeated pairwise merge. |

### Array+Functional

Functional operations on arrays.

| Method / Property | Description |
|---|---|
| `flattened() -> [Any]` | Recursively flattens a nested `[Any]` array into a single flat `[Any]`. |
| `compactMapped<T>(_ transform: (Element) -> T?) -> [T]` | Maps each element through `transform`, omitting `nil` results. Equivalent to `compactMap`. |

### Array+Random

Random generation.

| Method / Property | Description |
|---|---|
| `randomIntArray(size:between:and:) -> [Int]` | Returns an array of `size` random integers uniformly drawn from `[low, high]`. |
| `randomInt(between:and:) -> Int` | Returns a single random integer in `[low, high]`. |

---

## String Extensions

### String+Algorithms

| Method / Property | Description |
|---|---|
| `compressed() -> String` | Run-length encodes the string. Consecutive runs are collapsed to the character followed by the count (e.g., `"aaabb"` → `"a3b2"`). Single characters are left unchanged. |
| `reversedWords(delimiter:) -> String` | Reverses the order of substrings split by `delimiter` (e.g., `"a b c".reversedWords(delimiter: " ")` → `"c b a"`). |
| `isPalindrome: Bool` | Returns `true` if the string reads the same forwards and backwards (case-insensitive). |
| `isRotation(of:) -> Bool` | Returns `true` if this string is a rotation of `other` (case-insensitive). Uses the double-string containment trick. |
| `isAnagram(of:) -> Bool` | Returns `true` if this string is an anagram of `other` (case-insensitive). Compares sorted character arrays. |
| `characterStrings: [String]` | Splits the string into an array of single-character strings. |
| `firstNonRepeated: Character?` | Returns the first character that appears exactly once in the string, or `nil` if every character repeats. |
| `hasCorrectParentheses: Bool` | Returns `true` if every `(` has a matching `)` in the correct order. Uses a counter-based approach. |
| `isInDictionary: Bool` | Returns `true` if the string is a correctly spelled English word. Uses `UITextChecker` on iOS and `NSSpellChecker` on macOS. |
| `palindromeWithMinInsertions() -> String` | Returns a palindrome formed by inserting the minimum number of characters into the string. Uses dynamic programming (O(n²) time and space). |

### String+NearbyWords

| Method / Property | Description |
|---|---|
| `nearbyWords() -> [String]` | Returns all dictionary words that can be formed by substituting exactly one character with an adjacent key on a standard QWERTY keyboard. |

---

## Int Extensions

### Int+Arithmetic

| Method / Property | Description |
|---|---|
| `factorial(_ n: Int) -> Int` | Returns `n!` using recursion. |
| `factorialIterative(_ n: Int) -> Int` | Returns `n!` using iteration (O(1) space). |
| `divide(_ numerator: Int, by denominator: Int) throws -> Int` | Integer division using repeated subtraction — no `/` operator. Throws `ArithmeticError.divisionByZero` when `denominator` is 0. |

---

## Functional Utilities (Mimik)

Kotlin-inspired scope functions on `Comparable` and `Optional`.

| Method | Description |
|---|---|
| `takeIf(_ condition: (Self) -> Bool) -> Self?` | Returns the value if `condition` is `true`, otherwise `nil`. |
| `takeUnless(_ condition: (Self) -> Bool) -> Self?` | Returns the value if `condition` is `false`, otherwise `nil`. |
| `letMimik<R>(_ block: (Wrapped) -> R) -> R?` | If non-nil, unwraps and applies `block`, returning the result; otherwise `nil`. |

```swift
20.takeIf { $0 > 10 }       // → 20
20.takeUnless { $0 == 20 }  // → nil

let x: Int? = 1
x.letMimik { $0 + 1 }       // → 2
```

---

## Utilities

### SubarrayUtility

Static methods for common subarray problems.

| Method | Description |
|---|---|
| `subarray(of:summingTo:) -> [Int]?` | Returns the first contiguous subarray whose elements sum to `target`, or `nil`. Uses a sliding window over increasing window sizes. |
| `lengthOfLongestIncreasingSubarray(in:) -> Int` | Returns the length of the longest strictly-increasing contiguous subarray. O(n). |
| `longestIncreasingSubarray(in:) -> [Int]` | Returns the longest strictly-increasing contiguous subarray. O(n). |
| `threeElements(in:summingTo:) -> [Int]?` | Returns three elements from the array whose sum equals `target`, or `nil`. Uses a sorted two-pointer approach. O(n²). |
| `subarrayWithLeastAverage(in:size:) -> [Int]?` | Returns the contiguous subarray of exactly `size` elements with the smallest average. Uses a sliding window. O(n). |
| `triplets(from:withSumLessThan:) -> [[Int]]` | Returns all triplets whose sum is strictly less than `limit`. Uses a sorted two-pointer approach. O(n²). |
| `allPairs(from:summingTo:useDictionary:) -> [[Int]]` | Returns pairs whose sum equals `target`. When `useDictionary` is `false`, uses a sorted two-pointer approach and preserves duplicates for duplicate input values. When `true`, uses an O(n) hash-map approach returning one pair per unique value combination. |

### ArrayAddition

| Method | Description |
|---|---|
| `add(_ n: Int, to digits: [Int]) -> [Int]` | Adds integer `n` to a number represented as a most-significant-first digit array, propagating carries. Example: `add(2, to: [1, 2, 8])` → `[1, 3, 0]`. |

### MaximumStockProfit

| Method | Description |
|---|---|
| `buySell(prices: [Double]) -> StockTrade?` | Finds the buy and sell indices in a price series that maximise profit using a single-pass O(n) scan. Returns a `StockTrade(buyIndex:sellIndex:)`, or `nil` if the input has fewer than two prices. |

---

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
