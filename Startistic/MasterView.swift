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
            SignInView(signInViewModel: SignInViewModel(), viewRouter: viewRouter)
        case .userProfilePage:
            UserProfileView(viewRouter: viewRouter)
        case .activityPage:
            ActivityView(viewRouter: viewRouter)
        case .newOpPage:
            NewOpView(viewRouter: viewRouter)
        case .searchPage:
            SearchView(viewRouter: viewRouter)
        case .myOpsPage:
            MyOpsView(viewRouter: viewRouter)
        case .signUpPage:
           SignUpView(viewRouter: viewRouter, signUpViewModel: SignUpViewModel())
        case .newPortfolioPostPage:
            NewPortfolioPost(viewRouter: viewRouter)
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(viewRouter: ViewRouter())
    }
}
