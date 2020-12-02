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
    @Published private var UserProfileActivityModel: Activity = UserProfileViewModel.createUserActivity()
    
    private static func createUserActivity() -> Activity {
        let content = [["front","back"], ["front2", "back2"],["front3", "back3"],["front4", "back4"],["front5", "back5"], ["front6","back6"], ["front7", "back7"],["front8", "back8"],["front9", "back9"],["front10", "back10"]]
        //list of posts where the user ID matches the logged in user.
        return Activity(num_of_posts: content.count, content: content)
    }
    
    var posts: Array<Activity.Post> {
        UserProfileActivityModel.posts
    }
    
    func choose(post: Activity.Post) {
        UserProfileActivityModel.choose(post: post)
        
    }
}
