//
//  LoginViewModel.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 23.05.2024.
//

import Foundation

struct LoginRequestBodyAuth: Codable {
    let email: String
    let password: String
}

struct LoginAuthResponse: Codable {
    let access_token: String?
}

class LoginViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        if validateFields() {
            let defaults = UserDefaults.standard
            
                        AuthenticationService().login(email: email, password: password) { result in
                            switch result {
                            case .success(let token):
                                defaults.setValue(token, forKey: "access_token")
                                DispatchQueue.main.async {
                                    self.isAuthenticated = true
                                    print(token)
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
        }else {
            print("Giriş başarısız! Lütfen geçerli bir e-posta ve şifre girin.")
        }
        
    }
    
    func validateFields() -> Bool {
        guard !email.isEmpty, !password.isEmpty else {
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
        
        return true
    }
}
