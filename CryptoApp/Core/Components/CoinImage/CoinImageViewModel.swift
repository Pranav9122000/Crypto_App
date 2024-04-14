//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Kulkarni, Pranav on 14/07/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject{
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false

    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellabels = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSuscribers()
        self.isLoading = true
    }
    
    func addSuscribers() {
        
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellabels)
    }

}

