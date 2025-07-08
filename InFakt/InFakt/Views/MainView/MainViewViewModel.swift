//
//  MainViewViewModel.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import Foundation
import WebKit

class MainViewViewModel: NSObject, ObservableObject {
    let url: String = "https://front.infakt.pl"

}

extension MainViewViewModel: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        decisionHandler(.allow)
    }
}
