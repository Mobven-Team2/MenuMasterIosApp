//
//  RegisterViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/23/24.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var confirmText: String = ""
    @Published var errorMessage: String? //     You are here!
    
    func register() {
        if validateFields() {
            
        }else {
            print("Giriş başarısız! Lütfen geçerli bir e-posta ve şifre girin.")
        }
        
    }
    
    func validateFields() -> Bool {
        guard !email.isEmpty, !password.isEmpty, !fullName.isEmpty, !confirmPassword.isEmpty else {
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        if !emailPredicate.evaluate(with: email) {
            return false
        }
        
        if password.count < 6 {
            return false
        }
        
        if password != confirmPassword {
            return false
        }
        
        return true
    }

}

extension RegisterViewModel {
    func isMatched() -> Bool {
        if password != confirmPassword {
            confirmText = "Girdiğiniz şifreler uyuşmuyor. Tekrar deneyiniz."
            return false
        }
        else {
            return true
        }
    }
}
