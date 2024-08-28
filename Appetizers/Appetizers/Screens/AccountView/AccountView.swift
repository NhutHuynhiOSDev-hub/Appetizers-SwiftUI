//
//  AccountView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firtsName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthday = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name: ", text: $firtsName)
                    TextField("Last Name: ", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    DatePicker("Birthday",
                               selection: $birthday,
                               displayedComponents: .date)
                    Button {
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }
                }
            }
            .navigationTitle("🚀  Account")
        }
    }
}

#Preview {
    AccountView()
}
