//
//  ActivityView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct ActivityView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var activityViewModel = ActivityViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .top) {
                VStack  {
                    
                    HStack {
                        Image("Star")
                        Text("Activities").underline().font(.custom("Philosopher-Bold", size: headerFontSize))
                            //.padding(.trailing, 75)
                        VStack {
                            
                            Button(action: {
                                viewRouter.currentPage = .newPortfolioPostPage
                            },
                                label: {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.system(size: iconSize))
                                }
                            ).padding(.leading, 80)
        
                            Text("New Post").padding(.leading, 75)
                            
                            
                            
                        }//.frame(width: 385, alignment: .trailing)
                        
                    }//.padding(.trailing)
                    
                    
                    if activityViewModel.posts != nil {
                        ScrollView {
                            VStack {
                                ForEach(activityViewModel.posts!) { post in
                                    PostView(post: post ).padding().onTapGesture {
                                        withAnimation(.linear) {
                                            activityViewModel.choose(post: post)
                                        }
                                    }
                                }
                            .padding()
                            }
                        }.frame(width: 385, height: 550, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    
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

struct ActivityView_Preview: PreviewProvider {
    static var previews: some View {
        ActivityView(viewRouter: ViewRouter())
    }
}
