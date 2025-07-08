//
//  MainView.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainViewViewModel = .init()
    
    var body: some View {
        SafeWebView(url: viewModel.url, delegate: viewModel)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
