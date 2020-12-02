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
                                
                            }
                        }.padding()
                    }
                }.foregroundColor(Color.red)
                .padding()
                NavBar(viewRouter: viewRouter, yPos: geometry.size.height, xPos: geometry.size.width)
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(viewRouter: ViewRouter())
    }
}
