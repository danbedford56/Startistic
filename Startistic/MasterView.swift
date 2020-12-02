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
            let view = UserProfileView(viewRouter: viewRouter, userProfileViewModel: UserProfileViewModel())
            view.onAppear{
                view.userProfileViewModel.get_posts()
            }
        case .activityPage:
            ActivityView(viewRouter: viewRouter)
        case .newOpPage:
            NewOpView()
        case .searchPage:
            SearchView()
        case .myOpsPage:
            MyOpsView()
        case .signUpPage:
            SignUpView(signUpViewModel: SignUpViewModel(), viewRouter: viewRouter)
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(viewRouter: ViewRouter())
    }
}
