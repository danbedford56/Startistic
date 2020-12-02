//
//  PostView.swift
//  Startistic
//
//  Created by Morris, Jack Liam (J.) on 02/12/2020.
//

import SwiftUI

struct PostView: View {
    var post: Activity.Post
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
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
        
        }
        
        
    }
    private let fontScaleFactor: CGFloat = 1.5

}
