//
//  AccountView.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 24/8/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name: ", text: $accountViewModel.firtsName)
                    TextField("Last Name: ", text: $accountViewModel.lastName)
                    TextField("Email", text: $accountViewModel.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    DatePicker("Birthday",
                               selection: $accountViewModel.birthday,
                               displayedComponents: .date)
                    Button {
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                .tint(.brandPrimary)
                
                Section(header: Text("Request")) {
                    Toggle("Extra Napkinds", isOn: $accountViewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $accountViewModel.frequentRefills)
                }.tint(.brandPrimary)
                
            }
            .navigationTitle("🚀  Account")
        }
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
