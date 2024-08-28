//
//  Alert.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 26/8/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //Network context
    static let invalidData = AlertItem(title: Text("Server Error" ),
                                       message: Text("The data received from server was invalid. Please contact support."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error" ),
                                      message: Text("Invalid response from the server. Please try again later or contact support."),
                                      dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error" ),
                                           message: Text("There was an issue connecting to server. If this persists, please contact support."),
                                           dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error" ),
                                            message: Text("Unable to complete your request at this time. Please check your internet conncetion."),
                                            dismissButton: .default(Text("OK")))
    
    //Account context
    static let invalidForm = AlertItem(title: Text("Invalid Form" ),
                                            message: Text("Please ensure all the fields in form have been filled out."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email" ),
                                            message: Text("Please ensure your emmail is valid"),
                                            dismissButton: .default(Text("OK")))
}
