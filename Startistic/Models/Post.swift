//
//  Post.swift
//  Startistic
//
//  Created by Morris, Jack Liam (J.) on 03/12/2020.
//

import Foundation

struct Post: Identifiable {
    var isFaceUp: Bool = false
    var face_up_content: Any
    var face_down_content: Any
    var id: Int
}
