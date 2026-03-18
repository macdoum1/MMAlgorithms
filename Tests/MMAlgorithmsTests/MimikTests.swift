import XCTest
@testable import MMAlgorithms

final class MimikTests: XCTestCase {

    // MARK: - takeIf

    func testTakeIfConditionMet() {
        XCTAssertEqual(20.takeIf { $0 > 10 }, 20)
    }

    func testTakeIfConditionNotMet() {
        XCTAssertNil(20.takeIf { $0 < 20 })
    }

    // MARK: - takeUnless

    func testTakeUnlessConditionNotMet() {
        XCTAssertEqual(20.takeUnless { $0 < 10 }, 20)
    }

    func testTakeUnlessConditionMet() {
        XCTAssertNil(20.takeUnless { $0 == 20 })
    }

    // MARK: - letMimik

    func testLetMimikNonNil() {
        let value: Int? = 1
        XCTAssertEqual(value.letMimik { $0 + 1 }, 2)
    }

    func testLetMimikNil() {
        let value: Int? = nil
        XCTAssertNil(value.letMimik { $0 + 1 })
    }
}
