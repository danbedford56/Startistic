//
//  SignInViewModel.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import Foundation

class SignInViewModel : ObservableObject{
    
    
    func create_user() {
        let user : [String : Any] = ["username" : "Dan"]
        Database.create_user(user)
    }
    
}
