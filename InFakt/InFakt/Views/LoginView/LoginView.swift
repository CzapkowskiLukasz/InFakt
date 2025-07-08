//
//  LoginView.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewViewModel

    var body: some View {
        NavigationStack {
            SafeWebView(url: viewModel.url, delegate: viewModel)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
        }
        .navigationDestination(isPresented: $viewModel.loginSuccesful) {
            MainView()
        }
    }
}
