//
//  EntryView.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import SwiftUI

struct EntryView: View {
    @StateObject var viewModel = EntryViewViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Button("Zaloguj się") {
                    viewModel.showWebView = true
                }
                .buttonStyle(.solid)

            }
            .padding(64)
            .navigationDestination(isPresented: $viewModel.showWebView) {
                LoginView(viewModel: .init(loginShown: $viewModel.showWebView))
            }
            .navigationDestination(isPresented: $viewModel.loginSuccess) {
                MainView()
            }
        }
    }
}

#Preview {
    EntryView()
}
