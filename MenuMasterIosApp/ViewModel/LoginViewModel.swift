//
//  LoginViewModel.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 23.05.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    var loginValidator = Validator()
    var isAuthenticated: Bool = false
    
    func login() -> Bool {
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
        } else {
            self.isAuthenticated = false
            print("Giriş başarısız! Lütfen geçerli bir e-posta ve şifre girin.")
        }
        return isAuthenticated
    }
    
    func validateFields() -> Bool {
        return loginValidator.validateLoginFields(email, password)
    }
}
