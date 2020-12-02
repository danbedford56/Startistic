//
//  Activity.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import Foundation

class ActivityViewModel: ObservableObject {
    @Published private var model: Activity = ActivityViewModel.createActivity()
    
    private static func createActivity() -> Activity {
        let content = [["front","back"], ["front2", "back2"],["front3", "back3"],["front4", "back4"],["front5", "back5"]]
        return Activity(num_of_posts: content.count, content: content)
    }
    
    var posts: Array<Activity.Post> {
        model.posts
    }
    
    func choose(post: Activity.Post) {
        model.choose(post: post)
        
    }
}
