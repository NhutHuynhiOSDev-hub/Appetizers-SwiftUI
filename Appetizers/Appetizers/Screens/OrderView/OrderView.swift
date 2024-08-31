//
//  OrderView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems, id: \.id) { appetizer in
                            AppetizerListCell( appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItem)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order")
                    } label: {
                        APButton(title: "$99.99 - Place Order")
                    }
                }
                
                if orderItems.isEmpty {
                    EmptyState(title: "You have no items in your order.\nPlease add appetizer!", imageName: "empty_order")
                }
            }
            .navigationTitle("🗽 Orders")
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
