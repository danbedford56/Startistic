//
//  PostView.swift
//  Startistic
//
//  Created by Swizel Cardozo on 02/12/2020.
//
import SwiftUI

struct PostView: View {
    var post: Post
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack{
                if post.isFaceUp {
                    Text(post.face_up_content as! String)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height)*fontScaleFactor))
                        .foregroundColor(Color.black)
                        
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
