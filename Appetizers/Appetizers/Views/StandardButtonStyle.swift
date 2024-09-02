//
//  StandartButtonStyle.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 2/9/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.brandPrimary)
    }
}

extension View {
    
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
