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
                    TextField("First Name: ", text: $accountViewModel.user.firtsName)
                    TextField("Last Name: ", text: $accountViewModel.user.lastName)
                    TextField("Email", text: $accountViewModel.user.email)
                        .keyboardType(.emailAddress)
                         .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    DatePicker("Birthday",
                               selection: $accountViewModel.user.birthday,
                               displayedComponents: .date)
                    Button {
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                .tint(.brandPrimary)
                
                Section(header: Text("Request")) {
                    Toggle("Extra Napkinds", isOn: $accountViewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $accountViewModel.user.frequentRefills)
                }.tint(.brandPrimary)
                
            }
            .navigationTitle("🚀  Account")
        }
        .onAppear {
            accountViewModel.retrieveUser()
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
