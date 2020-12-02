//
//  Activity.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import Foundation
import FirebaseFirestore

class ActivityViewModel: ObservableObject {
    @Published private var model: Activity = ActivityViewModel.createActivity()
    
    static func createActivity() -> Activity {
        return Activity(num_of_posts: 1, content_up: "hello", content_down: "test")
    }
    
    var posts: Array<Activity.Post> {
        model.posts
    }
    
    
}
