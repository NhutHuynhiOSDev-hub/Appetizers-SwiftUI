//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers, id: \.id) {
                    appetizer in
                    
                    AppetizerListCell(appetizer: appetizer)
                }
                .listStyle(.plain)
                .navigationTitle("🍔 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            
            if (viewModel.isLoading) {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertIteam in
            Alert(title: alertIteam.title,
                  message: alertIteam.message,
                  dismissButton: alertIteam.dismissButton)
        }
    }
    
}


#Preview { 
    AppetizerListView()
}
