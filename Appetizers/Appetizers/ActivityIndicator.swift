//
//  ActivityIndicator.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 26/8/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}
