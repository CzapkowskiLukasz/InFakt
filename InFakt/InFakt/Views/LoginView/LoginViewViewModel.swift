//
//  LoginViewViewModel.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import Foundation
import WebKit
import SwiftUI
import LocalAuthentication

class LoginViewViewModel: NSObject, ObservableObject {
    @Published var isChecked: Bool = false
    @Published var loginSuccesful: Bool = false
    
    @Binding var loginShown: Bool
    
    let url: String = "https://konto.infakt.pl"
    private let notificationMenager: NotificationMenager = .init()
    
    init(loginShown: Binding<Bool>) {
        self._loginShown = loginShown
    }
    
    func handleLoginSuccess() {
        loginSuccesful = true
    }
    
}

extension LoginViewViewModel: WKNavigationDelegate {

    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {

        if let url = navigationAction.request.url, url.absoluteString != "about:blank" {
            extractCheckboxState(webView)

            if url.absoluteString.contains("front") {
                
                handleLoginSuccess()
                decisionHandler(.allow)
                loginShown = false
                return
            }
        }
        decisionHandler(.allow)
    }
    
    func extractCheckboxState(_ webView: WKWebView) {
        let js = "document.getElementById('user_remember_me')?.checked;"
        
        webView.evaluateJavaScript(js) { result, error in
            if let error = error {
                return
            }

            if let isChecked = result as? Bool, isChecked, !self.isChecked {
                self.promptFaceIDIfNeeded()
                self.isChecked = true
                UserDefaults.standard.set(self.isChecked, forKey: "biometricEnabled")
            } else if self.isChecked {
                self.isChecked = false
            }

        }
    }
    
    func promptFaceIDIfNeeded() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Używamy Face ID do zapamiętania logowania") { success, authError in
                DispatchQueue.main.async {
                    if success, let date = Calendar.current.date(byAdding: .day, value: 14, to: Date())  {
                        UserDefaults.standard.set(date, forKey: "biometricDate")
                        self.notificationMenager.scheduleNotification(after: 10, title: "InFakt", body: "Autologowanie będzie aktywne do \(date.formatted())")
                    }
                }
            }
        }
    }
}
