//
//  OrderView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    List {
                        ForEach(order.items, id: \.id) { appetizer in
                            AppetizerListCell( appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                }
                
                if order.items.isEmpty {
                    EmptyState(title: "You have no items in your order.\nPlease add appetizer!", imageName: "empty_order")
                }
            }
            .navigationTitle("🗽 Orders")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
