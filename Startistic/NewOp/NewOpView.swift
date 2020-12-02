//
//  NewOpView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//
import SwiftUI

struct NewOpView: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text("New Op page")
                NavBar(viewRouter: viewRouter, yPos: geometry.size.height, xPos: geometry.size.width)
            }
        }
    }
}

struct NewOpView_Previews: PreviewProvider {
    static var previews: some View {
        NewOpView(viewRouter: ViewRouter())
    }
}
