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
    
    var email: String = "admin@admin.com"
    var password: String = "123456"
    
    func login() {
        
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
    }
}
