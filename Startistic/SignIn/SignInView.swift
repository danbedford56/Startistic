//
//  SignInView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct SignInView: View {
    
    //MARK: Variable declarations
    
    @State private var username: String = ""
    @State private var password: String = ""
    @StateObject var viewRouter: ViewRouter
    
    //MARK: Views
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                VStack {
                    Image("Logo3").padding(.bottom, 50)
                    Text("Sign In").underline().padding(.vertical).font(.custom("Philosopher-Bold", size: headerFontSize))
                    Group {
                        Text("Username:").frame(width: textFrameWidth, height: textFrameHeight, alignment: .leading)
                        TextField("Enter your username here...", text: $username).padding()
                            .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                        .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                        Text("Password:").frame(width: textFrameWidth, height: textFrameHeight, alignment: .leading)
                        TextField("Enter your password here...", text: $password).padding()
                            .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                        .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                    }
                        .padding(.horizontal)

                    Group {
                        Button(action: {
                            print("Signed in")
                            viewRouter.currentPage = .userProfilePage
                        }, label: { Text("Sign in").font(.custom("Philosopher-Regular", size: 25)) })
                            .buttonStyle(StartisticButtonStyle(bgColor: deepRed))
                            .padding(.top, 100)
                        
                        Button(action: {
                            print("Signed up")
                        }, label: { Text("Sign up").font(.custom("Philosopher-Regular", size: 25)) })
                            .buttonStyle(StartisticButtonStyle(bgColor: deepRed))
                            .padding(.top, 50)
                    }
                        
                }
                    .foregroundColor(deepRed)
                    .font(.custom("Philosopher-Regular" ,size: bodyFontSize))
            }
        }
    }
    
    //MARK: Drawing Constants
    private let headerFontSize: CGFloat = 30
    private let bodyFontSize: CGFloat = 20
    private let textFrameWidth: CGFloat = 385
    private let textFrameHeight: CGFloat = 30
    private let textboxRoundedRectangleCornerRadius: CGFloat = 10
    private let textboxRoundedRectangleLineWidth: CGFloat = 2
    private let deepRed: Color = Color(red: 166/255, green: 0/255, blue: 0/255)

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewRouter: ViewRouter())
    }
}
