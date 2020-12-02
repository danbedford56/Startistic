//
//  SignInViewModel.swift
//  Startistic
//
//  Created by Morris, Jack Liam (J.) on 02/12/2020.
//

import Foundation
import SwiftUI

class SignInViewModel: ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
    @Published var id : String?
    @Published var invalid_details : Bool = false
    
    func check_login_details(logInHandler: @escaping () -> Void) {
        Database.fetch_users() { dataArray in
            self.invalid_details = true
            for user in dataArray {
                if user.username == self.username, user.password == self.password {
                    self.id = user.id
                    self.invalid_details = false
                    logInHandler()
                }
            }
        }
    }
}
