//
//  User.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import Foundation

struct User: Identifiable {
    
    var id: String
    var username: String
    var password: String
}

struct Portfolio: Identifiable {
    
    var id: String
    var user_id: String
    var post: String
}
