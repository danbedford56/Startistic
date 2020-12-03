//
//  UserProfileViewModel.swift
//  Startistic
//
//  Created by Morris, Jack Liam (J.) on 02/12/2020.
//

import Foundation
import SwiftUI

class UserProfileViewModel : ObservableObject {
    
    @Published var username : String = ""
    var user_id: String = ViewRouter.currentID!
    @Published var posts: Array<Post>?
    
    func get_posts() {
        Database.get_portfolio(user_id: user_id) { portfolio in
            self.posts = [Post(face_up_content: "HI", face_down_content: portfolio.post, id: 1)]
        }
    }
}
