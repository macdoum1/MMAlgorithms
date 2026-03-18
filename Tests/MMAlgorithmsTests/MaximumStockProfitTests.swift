import XCTest
@testable import MMAlgorithms

final class MaximumStockProfitTests: XCTestCase {
    func testMaximumProfit() {
        let prices = [2.15, 5.23, 1.00, 4.91, 8.01, 10.99, 3.32, 4.92]
        let trade = MaximumStockProfit.buySell(prices: prices)
        XCTAssertEqual(trade?.buyIndex, 2)
        XCTAssertEqual(trade?.sellIndex, 5)
    }
}
