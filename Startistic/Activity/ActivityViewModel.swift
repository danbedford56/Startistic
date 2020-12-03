//
//  Activity.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import Foundation


class ActivityViewModel: ObservableObject {
    
    
    @Published var posts: Array<Post>? = [Post(face_up_content: "HI", face_down_content: "Hello", id: 1),Post(face_up_content: "HI", face_down_content: "Hello", id: 2),Post(face_up_content: "HI", face_down_content: "Hello", id: 3),]
    
    func choose(post: Post) {
        let index = posts!.firstIndex(matching: post)
        self.posts![index!].isFaceUp = !self.posts![index!].isFaceUp
    }
}

