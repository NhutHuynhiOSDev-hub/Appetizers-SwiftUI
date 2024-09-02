//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 26/8/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var alertItem: AlertItem?
    @Published var appetizers: [Appetizer] = []
    @Published var selectdAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] results in
//            isLoading = false
//            DispatchQueue.main.async {
//                switch results {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//                    
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                    
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError  = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
