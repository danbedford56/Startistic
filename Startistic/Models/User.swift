//
//  User.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import Foundation

struct User: Identifiable {
    var id: String = UUID().uuidString
    var username: String
}
