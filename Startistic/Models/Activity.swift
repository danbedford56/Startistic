//
//  Activity.swift
//  Startistic
//
//  Created by Swizel Cardozo on 01/12/2020.
//


import Foundation

//struct Activity {
//
//    var posts: Array<Post>
//    var user_id: String = ViewRouter.currentID!
//    var content: Array<Array<String>> = []
//
//    init(){
//        posts = Array<Post>()
//        for i in 0..<content.count {
//            posts.append(Post(face_up_content: self.content[i][0], face_down_content: self.content[i][1] , id: i))
//        }
//    }
//
//    mutating func choose(post: Post) {
//        let index = posts.firstIndex(matching: post)
//        self.posts[index!].isFaceUp = !self.posts[index!].isFaceUp
//    }
//
//    mutating func get_posts() {
//        Database.get_portfolio(user_id: user_id) { portfolio in
//            self.content.append([portfolio.post, "Hello"])
//        }
//    }
//
//
//
//}
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
