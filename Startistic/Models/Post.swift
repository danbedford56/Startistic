//
//  Post.swift
//  Startistic
//
//  Created by Dan Bedford on 02/12/2020.
//

import Foundation

struct Post: Identifiable {
    var isFaceUp: Bool = false
    var face_up_content: Any
    var face_down_content: Any
    var id: Int
}
