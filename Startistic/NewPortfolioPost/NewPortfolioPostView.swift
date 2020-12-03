//
//  NewPortfolioPost.swift
//  Startistic
//
//  Created by Morris, Jack Liam (J.) on 02/12/2020.
//
import SwiftUI

struct NewPortfolioPost: View {
    @StateObject var viewRouter: ViewRouter
    @State var PortfolioPostTitle : String = ""
    @State var PortfolioPostContent : String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .top){
                VStack {
                    Text("New Portfolio Post").underline().font(.custom("Philosopher-Bold", size: headerFontSize)).padding()
                    Text("Post").underline().font(.custom("Philosopher-Bold", size: bodyFontSize))
                    Group {
                        Text("Title:").frame(width: textFrameWidth, height: textFrameHeight, alignment: .leading)
                            TextField("Enter the title of your post here...", text: $PortfolioPostTitle).padding()
                                .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                            .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                                .frame(width: 375, height: 75, alignment: .top)
                    }
                    Group {
                        Text("Content:").frame(width: textFrameWidth, height: textFrameHeight, alignment: .leading)
                            TextField("Enter your post here...", text: $PortfolioPostContent).padding()
                                .overlay(RoundedRectangle.init(cornerRadius: textboxRoundedRectangleCornerRadius)
                                            .stroke(lineWidth: textboxRoundedRectangleLineWidth))
                                .frame(width: 375, height: 400, alignment: .top)
                    }
                    
                    Group {
                        Button(action: {
    //                        viewRouter.currentPage = .signInPage
    //                        viewRouter.currentUser = nil
                        },
                            label: {
                                Image(systemName: "paperplane")
                                    .font(.system(size: iconSize))
                            }
                        )
                        Text("Post")
                    }
                    .frame(alignment: .bottom)
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

struct NewPortfolioPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPortfolioPost(viewRouter: ViewRouter())
    }
}
