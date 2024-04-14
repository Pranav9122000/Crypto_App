//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 14/07/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticsModel] = []
//        StatisticsModel(title: "Market Cap", value: "$2.58Tr", percentageChange: 1.02),
//        StatisticsModel(title: "24h Volume", value: "$342.76Bn"),
//        StatisticsModel(title: "BTC Dominance", value: "45.37"),
//        StatisticsModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
//    ]

    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var sortOption: SortOptions = .holdings
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    enum SortOptions {
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }
    
    init() {
        addSuscribers()
        suscriberForPortfolioCoins()
        suscribersForMarketData()
    }
    
    func addSuscribers() {
        
        // Update coins
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // After 0.5 seconds filtering starts
            .map(filterAndSortCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    func suscribersForMarketData() {
        
        // This updates market Data
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedData) in
                self?.statistics = returnedData
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func suscriberForPortfolioCoins() {
        
        // Updates PortfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
            }
            .store(in: &cancellables)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortOptions) -> [CoinModel] {
        
        var updatedCoins = filterCoin(text: text, coins: coins)
        let sortedCoins = sortCoins(sort: sort, coins: &updatedCoins)
        
        return updatedCoins
    }
    
    private func sortCoins(sort: SortOptions, coins: inout [CoinModel]) {
        
        switch sort {
        case .rank, .holdings:
             coins.sort(by: {$0.rank < $1.rank })
        case .rankReversed, .holdingsReversed:
             coins.sort(by: {$0.rank > $1.rank })
        case .price:
             coins.sort(by: {$0.currentPrice < $1.currentPrice })
        case .priceReversed:
             coins.sort(by: {$0.currentPrice > $1.currentPrice })
            }
        }

    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
        
        switch sortOption {
        case .holdings:
            return coins.sorted(by: { $0.currentHoldingsValue > $1.currentHoldingsValue })
        case .holdingsReversed:
            return coins.sorted(by: { $0.currentHoldingsValue < $1.currentHoldingsValue })
        default:
            return coins
        }
    }

    
    private func filterCoin(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
                    coin.id.lowercased().contains(lowercasedText) ||
                    coin.symbol.lowercased().contains(lowercasedText)
        }

    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticsModel] {
        var stats: [StatisticsModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }

        let marketCap = StatisticsModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)

        let volume = StatisticsModel(title: "24h Volume", value: data.volume)

        let btcDominance = StatisticsModel(title: "BTC Dominance", value: data.btcDominance)
                
        let portfolioValue =
            portfolioCoins
                .map({ $0.currentHoldingsValue})
                .reduce(0, +)
        
        let previousValue =
            portfolioCoins
                .map { (coin) -> Double in
                    let currentValue = coin.currentHoldingsValue
                    let percentChange = (coin.priceChangePercentage24H ?? 0) / 100
                    let previousValue = currentValue / (1 + percentChange)
                    return previousValue
                }
                .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100

        let portfolio = StatisticsModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)

       
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        
        return stats
    }
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
       
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
    }
    
    
}
