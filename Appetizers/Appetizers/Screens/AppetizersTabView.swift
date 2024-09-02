//
//  ContentView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct AppetizersTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Other")
                }
        }
        .accentColor(.primary)
    }
}


#Preview {
    AppetizersTabView()
        .environmentObject(Order())
}
