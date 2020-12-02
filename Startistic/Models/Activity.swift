//
//  Activity.swift
//  Startistic
//
//  Created by Swizel Cardozo on 01/12/2020.
//

import Foundation

struct Activity {
    
    var posts: Array<Post>
    
    init(num_of_posts: Int, content: Array<Array<Any>>){
        posts = Array<Post>()
        for i in 0..<num_of_posts {
            posts.append(Post(face_up_content: content[i][0], face_down_content: content[i][1] , id: i))
        }
    }
    
    mutating func choose(post: Post) {
        let index = posts.firstIndex(matching: post)
        self.posts[index!].isFaceUp = !self.posts[index!].isFaceUp
    }
    
    struct Post: Identifiable {
        var isFaceUp: Bool = false
        var face_up_content: Any
        var face_down_content: Any
        var id: Int
    }
        

}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
