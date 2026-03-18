public struct StockTrade {
    public let buyIndex: Int
    public let sellIndex: Int
}

public enum MaximumStockProfit {
    /// Returns the buy/sell indices that maximise profit from a price series.
    public static func buySell(prices: [Double]) -> StockTrade? {
        guard prices.count > 1 else { return nil }
        var currentMinBuy = prices[0]
        var maxProfit: Double = .leastNormalMagnitude
        var buyIndex = 0
        var sellIndex = 0

        for i in 1..<prices.count {
            let profit = prices[i] - currentMinBuy
            if profit > maxProfit {
                maxProfit = profit
                sellIndex = i
            }
            if prices[i] < currentMinBuy {
                currentMinBuy = prices[i]
                buyIndex = i
            }
        }
        return StockTrade(buyIndex: buyIndex, sellIndex: sellIndex)
    }
}
