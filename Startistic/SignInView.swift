//
//  SignInView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct SignInView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                VStack {
                    Image("Logo").padding(.bottom, 50)
                    Text("Sign In").bold().underline().padding(.vertical)
                    Group {
                        Text("Username:").frame(width: 385, height: 30, alignment: .leading)
                        TextField("Enter your username here...", text: $username).padding()
                            .overlay(RoundedRectangle.init(cornerRadius: 10).stroke(lineWidth: 2))
                    
                        Text("Password:").frame(width: 385, height: 30, alignment: .leading)
                        TextField("Enter your password here...", text: $password).padding()
                            .overlay(RoundedRectangle.init(cornerRadius: 10).stroke(lineWidth: 2))
                    }
                        .padding(.horizontal)
                    
                    Group {
                        Button(action: {
                            print("Signed in")
                        }, label: { Text("Sign in") })
                        .buttonStyle(StartisticButtonStyle(bgColor: .red))
                        .padding(.top, 100)
                        
                        Button(action: {
                            print("Signed up")
                        }, label: { Text("Sign up") })
                        .buttonStyle(StartisticButtonStyle(bgColor: .red))
                        .padding(.top, 50)
                    }
                        
                }
                    .foregroundColor(.red)
                    .font(.system(size: 20))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
