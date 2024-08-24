//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack{
            List(MockData.appetizers, id: \.id) {
                appetizer in
                
                AppetizerListCell(appetizer: appetizer)
            }
            .listStyle(.plain)
            .navigationTitle("🍔 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
