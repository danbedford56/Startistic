//
//  SearchView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var userProfileViewModel = UserProfileViewModel()
    @State var searchCriteria : String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .top) {
                VStack  {
                    HStack {
                        Image("Startistic-Star")
                        if viewRouter.currentUser != nil {
                            Text("Search").underline().font(.custom("Philosopher-Bold", size: headerFontSize))
                        }
                    }
                    .padding(.bottom, 15)
                    HStack (alignment: .center) {
                        TextField("Search...", text: $searchCriteria).padding()
                            .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                        .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                            .frame(width: 300, height: 75, alignment: .center)
                        
                        Button(action: {
//                            viewRouter.currentPage = .searchPage
                        }, label: { Image(systemName: "magnifyingglass").font(.system(size: iconSize)) })
                    }
                    .padding(.bottom, 15)
                    
//                    if userProfileViewModel.posts != nil {
                        ScrollView {
                            VStack {
                                Text("Search results go here")
//                                ForEach(userProfileViewModel.posts!) { post in
//                                    PostView(post: post ).padding().onTapGesture {
//                                        withAnimation(.linear) {
//                                            //userProfileViewModel.choose(post: post)
//                                        }
//                                    }
//                                }
                            .padding()
                            }
                        }.frame(width: 385, height: 550, alignment: .center)
                    //}
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
    private let textFrameWidth: CGFloat = 385
    private let textFrameHeight: CGFloat = 30
    private let textboxRoundedRectangleCornerRadius: CGFloat = 10
    private let textboxRoundedRectangleLineWidth: CGFloat = 2
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewRouter: ViewRouter())
    }
}
