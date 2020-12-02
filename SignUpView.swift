//
//  SignUpView.swift
//  Startistic
//
//  Created by Dan Bedford on 01/12/2020.
//

import SwiftUI

struct SignUpView: View {
    
    //MARK: Variable declarations
    @ObservedObject var signUpViewModel: SignUpViewModel
    @StateObject var viewRouter: ViewRouter
    
    //MARK: Views
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                VStack {
                    Image("Logo").padding(.bottom, 50)
                    Text("Sign Up").underline().padding(.vertical).font(.custom("Philosopher-Bold", size: headerFontSize))
                    Group {
                        Text("Username:").frame(width: textFrameWidth, height: textFrameHeight, alignment: .leading)
                        TextField("Enter your username here...", text: $signUpViewModel.username).padding()
                          .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                        Text("Password:").frame(width: textFrameWidth, height: textFrameHeight, alignment: .leading)
                        TextField("Enter your password here...", text: $signUpViewModel.password).padding()
                          .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                        Text("Confirm Password:").frame(width: textFrameWidth, height: textFrameHeight, alignment: .leading)
                        TextField("Enter your password here...", text: $signUpViewModel.confirmed_password).padding()
                          .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                        if signUpViewModel.unmatched {
                            Text("Passwords do not match")
                        }
                        if signUpViewModel.username_taken {
                            Text("This username is already taken 🙁")
                        }
                    }
                        .padding(.horizontal)
                    Group {
                        Button(action: {
                            let logInHandler:() -> Void = {
                                if signUpViewModel.valid_account {
                                    viewRouter.currentPage = .userProfilePage
                                }
                            }
                            signUpViewModel.create_user(logInHandler: logInHandler)
                        }, label: { Text("Sign Up").font(.custom("Philosopher-Regular", size: 25)) })
                            .buttonStyle(StartisticButtonStyle(bgColor: deepRed))
                            .padding(.top, 50)
                            .padding(.bottom, 25)
                        Text("Already have an account?").frame(width: textFrameWidth, height: textFrameHeight, alignment: .center)
                        Button(action: {
                            print("Sign In")
                            viewRouter.currentPage = .signInPage
                        }, label: { Text("Sign In").font(.custom("Philosopher-Regular", size: 25)) })
                            .buttonStyle(StartisticButtonStyle(bgColor: deepRed))
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

struct SignupView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView(signUpViewModel: SignUpViewModel(), viewRouter: ViewRouter())
  }
}
