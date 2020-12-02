//
//  ActivityView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct ActivityView: View {
    //@ObservedObject var activityViewModel = ActivityViewModel()
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    
                }
                NavBar(viewRouter: viewRouter, yPos: geometry.size.height, xPos: geometry.size.width)
            }
        }
    }
}

//struct PostView: View {
//    var post: Activity.Post
//
//    var body: some View {
//        if post.isFaceUp {
//                Text(post.face_up_content)
//            }
//            .cardify(isFaceUp: post.isFaceUp)
//            .transition(AnyTransition.scale)
//    }
//}
    
struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(viewRouter: ViewRouter())
    }
}
