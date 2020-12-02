//
//  NavigationHelper.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import Foundation
import SwiftUI

enum Page {
    case signInPage
    case userProfilePage
    case activityPage
    case newOpPage
    case searchPage
    case myOpsPage
    case signUpPage
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .signInPage
    @Published var currentUser: String?
    static var currentID: String?
}

struct NavBar : View {
    
    @StateObject var viewRouter: ViewRouter
    
    var yPos: CGFloat
    var xPos: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [deepRed, Color.white]), startPoint: .top, endPoint: .bottom)).frame(height: 100)
            HStack {
                Button(action: {
                    viewRouter.currentPage = .activityPage
                }, label: { Image(systemName: "house.fill").font(.system(size: iconSize)) }).padding(.trailing)
                Button(action: {
                    viewRouter.currentPage = .newOpPage
                }, label: { Image(systemName: "plus").font(.system(size: iconSize)) }).padding(.trailing)
                Button(action: {
                    viewRouter.currentPage = .searchPage
                }, label: { Image(systemName: "magnifyingglass").font(.system(size: iconSize)) }).padding(.trailing)
                Button(action: {
                    viewRouter.currentPage = .myOpsPage
                }, label: { Image(systemName: "note.text").font(.system(size: iconSize)) }).padding(.trailing)
                Button(action: {
                    viewRouter.currentPage = .userProfilePage
                }, label: { Image(systemName: "person.fill").font(.system(size: iconSize)) })
            }
        }
        .position(x: xPos * xMultiplier, y: yPos - 15)
        .foregroundColor(.black)
    }
    
    // MARK: Drawing Constants
    let xMultiplier: CGFloat = 0.5
    let yOffset: CGFloat = 15
    let iconSize: CGFloat = 40
    private let deepRed: Color = Color(red: 166/255, green: 0/255, blue: 0/255)
}
