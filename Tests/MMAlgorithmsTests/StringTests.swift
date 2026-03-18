import XCTest
@testable import MMAlgorithms

// MARK: - String compression (from MMAlgorithms)

final class StringCompressionTests: XCTestCase {
    func testStringCompression() {
        XCTAssertEqual("aaabbccdddd".compressed(), "a3b2c2d4")
    }

    func testStringCompressionWithSingleChars() {
        XCTAssertEqual("abbccdd".compressed(), "ab2c2d2")
    }
}

// MARK: - HandyAlgs (from NSString-HandyAlgs)

final class HandyAlgsTests: XCTestCase {
    func testReverseString() {
        XCTAssertEqual(String("Hello World".reversed()), "dlroW olleH")
    }

    func testReverseWords() {
        XCTAssertEqual("This is a test sentence".reversedWords(delimiter: " "),
                       "sentence test a is This")
    }

    func testIsPalindrome() {
        XCTAssertTrue("Mom".isPalindrome)
        XCTAssertFalse("Hello".isPalindrome)
    }

    func testIsRotation() {
        XCTAssertTrue("RotatedString".isRotation(of: "StringRotated"))
        XCTAssertFalse("hello".isRotation(of: "world"))
    }

    func testIsAnagram() {
        XCTAssertTrue("Silent".isAnagram(of: "Listen"))
        XCTAssertFalse("hello".isAnagram(of: "world"))
    }

    func testCharacterStrings() {
        XCTAssertEqual("abc".characterStrings, ["a", "b", "c"])
    }

    func testFirstNonRepeated() {
        XCTAssertEqual("ababnexnetjtj".firstNonRepeated, "x")
    }

    func testHasCorrectParentheses() {
        XCTAssertTrue("()".hasCorrectParentheses)
        XCTAssertTrue("(())".hasCorrectParentheses)
        XCTAssertFalse("())".hasCorrectParentheses)
        XCTAssertFalse(")(".hasCorrectParentheses)
    }

    func testPalindromeWithMinInsertionsSingleChar() {
        XCTAssertEqual("a".palindromeWithMinInsertions(), "a")
    }

    func testPalindromeWithMinInsertionsAlreadyPalindrome() {
        let result = "aba".palindromeWithMinInsertions()
        XCTAssertEqual(result, "aba")
    }

    func testPalindromeWithMinInsertionsTwoChars() {
        let result = "ab".palindromeWithMinInsertions()
        XCTAssertTrue(result.isPalindrome)
        XCTAssertEqual(result.count, 3)
    }

    func testPalindromeWithMinInsertionsRace() {
        let result = "race".palindromeWithMinInsertions()
        XCTAssertTrue(result.isPalindrome)
        XCTAssertEqual(result.count, 7) // 3 insertions → "racecar"
    }

    func testPalindromeWithMinInsertionsAbcd() {
        let result = "abcd".palindromeWithMinInsertions()
        XCTAssertTrue(result.isPalindrome)
        XCTAssertEqual(result.count, 7) // 3 insertions needed
    }
}
