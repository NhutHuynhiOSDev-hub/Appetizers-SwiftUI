//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 26/8/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] results in
            isLoading = false
            DispatchQueue.main.async {
                switch results {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
