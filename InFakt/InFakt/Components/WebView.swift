//
//  WebView.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import SwiftUI
import WebKit

struct SafeWebView: View {
    let url: String
    let delegate: WKNavigationDelegate
    
    var body: some View {
        if let url = URL(string: url) {
            WebView(url: url, delegate: delegate)
        } else {
            Text("Niepoprawny URL: \(url)")
                .foregroundColor(.red)
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    let delegate: WKNavigationDelegate
    
    func makeUIView(context: Context) -> WKWebView {
        let webView: WKWebView = .init()
        webView.navigationDelegate = delegate
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
}

//#Preview {
//    WebViewScreen(url: "https://google.com")
//}
