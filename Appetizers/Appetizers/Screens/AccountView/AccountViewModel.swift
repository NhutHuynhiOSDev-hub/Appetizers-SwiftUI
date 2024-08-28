//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 28/8/24.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published var firtsName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firtsName.isEmpty &&
                !lastName.isEmpty &&
                !email.isEmpty else {
            
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
        
            alertItem = AlertContext.invalidEmail
            return  false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        print("Changes have been saved successfully")
    }
}
