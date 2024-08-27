//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 26/8/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString:  appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
            
            HStack(spacing: 40) {
                NutritionInfo(title: "Calories", value: appetizer.carbs)
                NutritionInfo(title: "Carbs", value: appetizer.carbs)
                NutritionInfo(title: "Protein", value: appetizer.protein) 
            }
        
            Spacer()
            
            Button {
                print("Tap")
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .italic()
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}
