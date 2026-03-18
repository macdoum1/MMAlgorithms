import XCTest
@testable import MMAlgorithms

final class NearbyWordsTests: XCTestCase {

    func testCharacterStrings() {
        XCTAssertEqual("gi".characterStrings, ["g", "i"])
    }

    func testNearbyWords() {
        let nearby = "gi".nearbyWords()
        // Spell-checker results may vary; assert expected words are present.
        XCTAssertTrue(nearby.contains("hi"))
        XCTAssertTrue(nearby.contains("fi"))
        XCTAssertTrue(nearby.contains("go"))
    }

    func testNearbyWordsWithEmptyString() {
        XCTAssertEqual("".nearbyWords(), [])
    }
}
