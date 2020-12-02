//
//  SignUpViewModel.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import Foundation
import SwiftUI

class SignUpViewModel : ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
    @Published var confirmed_password : String = ""
    @Published var unmatched : Bool = false
    @Published var username_taken : Bool = false
    var valid_account: Bool = false
    
    func create_user() {
        username_taken = check_username_existing()
        unmatched = false
        if password == confirmed_password && !username_taken, username != "" && password != "" {
            Database.create_user(["username" : username, "password" : password])
        }else if password != confirmed_password {
            unmatched = true
        }
    }
    private func check_username_existing() -> Bool{
        var taken: Bool = false
        DispatchQueue.global(qos: .userInitiated).async {
            if let users = try? Database.fetch_users() {
                DispatchQueue.main.async {
                    for user in users {
                        if user.username == self.username {
                            taken =  true
                        }
                    }
                }
            }
        }
        return taken
       
    }
}
