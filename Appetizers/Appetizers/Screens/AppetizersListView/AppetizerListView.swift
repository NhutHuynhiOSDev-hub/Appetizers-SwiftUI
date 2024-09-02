//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers, id: \.id) {
                    appetizer in
                    
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectdAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("🍔 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
              
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectdAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}


#Preview { 
    AppetizerListView()
        .environmentObject(Order())
}
