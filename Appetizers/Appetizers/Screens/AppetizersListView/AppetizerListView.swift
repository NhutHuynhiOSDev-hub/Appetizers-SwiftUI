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
    @State private var isShowingDetail = false
    @State private var selectdAppetizer: Appetizer?
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers, id: \.id) {
                    appetizer in
                    
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectdAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .listStyle(.plain)
                .disabled(isShowingDetail)
                .navigationTitle("🍔 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
              
            if isShowingDetail {
                AppetizerDetailView(appetizer: selectdAppetizer!,
                                    isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.isLoading {
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
