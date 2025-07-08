//
//  EntryViewViewModel.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import Foundation
import LocalAuthentication

class EntryViewViewModel: ObservableObject {
    @Published var isChecked: Bool = false
    @Published var showWebView: Bool = false
    @Published var loginSuccess: Bool = false
    
    init() {
        NotificationMenager.init().requestNotificationPermission()
        
        if UserDefaults.standard.bool(forKey: "biometricEnabled"), let savedDate = UserDefaults.standard.object(forKey: "biometricDate") as? Date, savedDate > .now {
            authenticateWithFaceID()
        }
    }
    
    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Logowanie za pomocą Face ID") { success, authError in
                DispatchQueue.main.async {
                    if success {
                        self.loginSuccess = true
                    }
                }
            }
        }
    }
}

extension LoginViewViewModel {

}
