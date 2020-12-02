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
    @Published var valid_account : Bool = false
    
    func create_user(logInHandler: @escaping () -> Void) {
        // Pulling the user data from the database
        Database.fetch_users() { dataArray in
            // Checks username against other users
            self.username_taken = false
            for user in dataArray {
                if user.username == self.username {
                    self.username_taken = true
                    break
                }
            }
            
            //Validates the account details
            print(self.username_taken)
            self.unmatched = false
            
            if self.username_taken == false && self.password == self.confirmed_password && self.username != "" && self.password != "" {
                self.valid_account = true
                Database.create_user(["username" : self.username, "password" : self.password])
                self.username = ""
                self.password = ""
                self.confirmed_password = ""
            } else if self.password != self.confirmed_password {
                self.unmatched = true
            }
            
            logInHandler()
        }
    }
}
