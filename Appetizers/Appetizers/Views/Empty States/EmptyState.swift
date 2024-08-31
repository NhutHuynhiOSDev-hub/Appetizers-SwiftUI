//
//  Empty State.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 31/8/24.
//

import SwiftUI

struct EmptyState: View {
    
    var title: String
    var imageName: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -50)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    EmptyState(title: "Default", imageName: "empty_order")
}
