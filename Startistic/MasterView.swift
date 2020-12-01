//
//  MasterView.swift
//  Startistic
//
//  Created by Dan Bedford on 27/11/2020.
//

import SwiftUI

struct MasterView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .signInPage:
            SignInView(viewRouter: viewRouter)
        case .userProfilePage:
            UserProfileView(viewRouter: viewRouter)
        case .activityPage:
            ActivityView()
        case .newOpPage:
            NewOpView()
        case .searchPage:
            SearchView()
        case .myOpsPage:
            MyOpsView()
        case .signUpPage:
            SignUpView(viewRouter: viewRouter)
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(viewRouter: ViewRouter())
    }
}
