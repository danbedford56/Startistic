//
//  UserProfileView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct UserProfileView: View {

    @StateObject var viewRouter: ViewRouter
    @ObservedObject var userProfileViewModel = UserProfileViewModel()

    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .top) {
                VStack  {
                    HStack {
                        Button(action: {
                            viewRouter.currentPage = .signInPage
                            viewRouter.currentUser = nil
                        }, label: { Image(systemName: "arrow.backward.circle.fill").font(.system(size: iconSize)) })
                            .padding(.trailing, 275)

                        Button(action: {
                             viewRouter.currentPage = .activityPage
                        }, label: { Image(systemName: "gearshape.fill").font(.system(size: iconSize)) })
                    }
                    
                    Text("Sign Out").position(x: 40, y: 10).frame(width:400, height: 20)
                    Text("Profile Page").underline().font(.custom("Philosopher-Bold", size: headerFontSize))
                    if viewRouter.currentUser != nil {
                        Text("Welcome \(viewRouter.currentUser!)")
                    }
                    ScrollView {
                        VStack {
                            ForEach(userProfileViewModel.posts) { post in
                                PostView(post: post ).padding().onTapGesture {
                                    withAnimation(.linear) {
                                        userProfileViewModel.choose(post: post)
                                    }
                                }
                            }
                        .padding()
                        }
                    }.frame(width: 300, height: 500, alignment: .center)
                }
                NavBar(viewRouter: viewRouter, yPos: geometry.size.height, xPos: geometry.size.width)
            }
         .foregroundColor(deepRed)
         .font(.custom("Philosopher-Regular" ,size: bodyFontSize))
        }
    }
    //MARK: Drawing Constants
    private let headerFontSize: CGFloat = 30
    private let bodyFontSize: CGFloat = 20
    let iconSize: CGFloat = 40
    private let deepRed: Color = Color(red: 166/255, green: 0/255, blue: 0/255)
 }

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(viewRouter: ViewRouter())
    }
}
