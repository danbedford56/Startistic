//
//  MyOpsView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//
import SwiftUI

struct MyOpsView: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text("My Opportunities page")
                NavBar(viewRouter: viewRouter, yPos: geometry.size.height, xPos: geometry.size.width)
            }
        }
    }
}

struct MyOpsView_Previews: PreviewProvider {
    static var previews: some View {
        MyOpsView(viewRouter: ViewRouter())
    }
}
