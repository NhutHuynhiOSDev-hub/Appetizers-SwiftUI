//
//  String+Ext.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 28/8/24.
//

import SwiftUI
import RegexBuilder

extension String {
    
    var isValidEmail: Bool {
        
        if #available(iOS 16.0, *) {
            let emailRegex = Regex {
                OneOrMore {
                    CharacterClass(
                        .anyOf("._%+-"),
                        ("A"..."Z"),
                        ("0"..."9"),
                        ("a"..."z")
                    )
                }
                "@"
                OneOrMore {
                    CharacterClass(
                        .anyOf(".-"),
                        ("A"..."Z"),
                        ("a"..."z"),
                        ("0"..."9")
                    )
                }
                "."
                Repeat(2...64) {
                    CharacterClass(
                        ("A"..."Z"),
                        ("a"..."z")
                    )
                }
            }
            return self.wholeMatch(of: emailRegex) != nil
        } else {
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPred.evaluate(with: self)
        }
    }
}
