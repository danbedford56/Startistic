//
//  UserProfileViewModel.swift
//  Startistic
//
//  Created by Dan Bedford on 02/12/2020.
//

import Foundation
import SwiftUI

class UserProfileViewModel : ObservableObject {

    @Published var username : String = ""
    @Published private var userProfileActivityModel: Activity = UserProfileViewModel.createUserActivity()

    private static func createUserActivity() -> Activity {
        let content = [["front","back"], ["front2", "back2"],["front3", "back3"],["front4", "back4"],["front5", "back5"]]
        //list of posts where the user ID matches the logged in user.
        return Activity(num_of_posts: content.count, content: content)
    }

    var posts: Array<Activity.Post> {
        userProfileActivityModel.posts
    }

    func choose(post: Activity.Post) {
        userProfileActivityModel.choose(post: post)
    }
}
