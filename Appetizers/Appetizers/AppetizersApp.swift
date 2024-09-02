//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizersTabView().environmentObject(order)
        }
    }
}
