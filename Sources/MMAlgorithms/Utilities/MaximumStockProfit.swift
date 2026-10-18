public struct StockTrade {
    public let buyIndex: Int
    public let sellIndex: Int
}

public enum MaximumStockProfit {
    /// Returns the earliest buy/sell indices for the largest positive profit.
    /// Returns nil when fewer than two prices are supplied or no gain is possible.
    public static func buySell(prices: [Double]) -> StockTrade? {
        guard prices.count > 1 else { return nil }
        var currentMinBuy = prices[0]
        var currentMinIndex = 0
        var maxProfit = 0.0
        var bestBuy = 0
        var bestSell = 0

        for i in 1..<prices.count {
            let profit = prices[i] - currentMinBuy
            if profit > maxProfit {
                maxProfit = profit
                bestBuy = currentMinIndex
                bestSell = i
            }
            if prices[i] < currentMinBuy {
                currentMinBuy = prices[i]
                currentMinIndex = i
            }
        }
        return maxProfit > 0 ? StockTrade(buyIndex: bestBuy, sellIndex: bestSell) : nil
    }
}
