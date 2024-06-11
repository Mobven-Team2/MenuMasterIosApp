//
//  LoginViewModel.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 23.05.2024.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var userId : String = ""
    
    var loginValidator = Validator()
    
    func login() {
        if validateFields() {
            let defaults = UserDefaults.standard
            
            LoginService().loginUserFunc(email: email, password: password) { result in
                switch result {
                    
                case .success(let token):
                    defaults.setValue(token, forKey: "access_token")
                    JWTDecoderHelper.handleJWTToken(token) { userId in
                        if let userId = userId {
                            DispatchQueue.main.async {
                                self.userId = userId
                                self.isAuthenticated = true
                                defaults.setValue(userId, forKey: "userId")
                                print("User ID: \(userId)")
                            }
                        } else {
                            // Handle error
                        }
                    }

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            self.isAuthenticated = false
            print("Giriş başarısız! Lütfen geçerli bir e-posta ve şifre girin.")
        }
    }
    
    
    func validateFields() -> Bool {
        return loginValidator.validateLoginFields(email, password)
    }
}
