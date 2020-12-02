//
//  ActivityView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activityViewModel = ActivityViewModel()
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    VStack {
                        ForEach(activityViewModel.posts) { post in
                            PostView(post: post ).padding().onTapGesture {
                                withAnimation(.linear) {
                                    activityViewModel.choose(post: post)

                                }
                                
                            }.padding(.bottom)
                        }.padding()
                    }
                }.foregroundColor(Color.red)
                .padding()
                NavBar(viewRouter: viewRouter, yPos: geometry.size.height, xPos: geometry.size.width)
                
            }
            
        }
    }
}

struct PostView: View {
    var post: Activity.Post
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                if post.isFaceUp {
                    Text(post.face_up_content as! String)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height)*fontScaleFactor))
                        .foregroundColor(Color.black)
                        .padding()
                }
                else{
                    Text(post.face_down_content as! String)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height)*fontScaleFactor))
                        .foregroundColor(Color.black)
                        .padding()
                }
            }.cardify(isFaceUp: post.isFaceUp)
            .transition(AnyTransition.scale)
            .padding(.bottom)
        
        }
        
        
    }
    private let fontScaleFactor: CGFloat = 1.5

}
    

    
struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(viewRouter: ViewRouter())
    }
}
