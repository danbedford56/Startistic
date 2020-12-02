//
//  Activity.swift
//  Startistic
//
//  Created by Swizel Cardozo on 01/12/2020.
//

import Foundation

class Activity {
    var posts: Array<Post>
    init(num_of_posts: Int, content_up: String, content_down: String){
        posts = Array<Post>()
        for i in 0..<num_of_posts {
        posts.append(Post(face_up_content: content_up, face_down_content: content_down, id: i))
        }
    }
    struct Post: Identifiable {
        var isFaceUp: Bool = false
        var face_up_content: Any
        var face_down_content: Any
        var id: Int
        
    }

}

