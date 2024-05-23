//
//  MockAuthenticationViewModel.swift
//  MenuMasterIosApp
//
//  Created by Barış Temiz on 23.05.2024.
//

import Foundation
import Combine

class MockAuthenticationViewModel {
    // Login
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginResponse: LoginResponse?
    @Published var loginErrorMessage: String?
    
    // Register
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var registerPassword: String = ""
    @Published var passwordConfirm: String = ""
    @Published var registerEmail: String = ""
    @Published var registerResponse: RegisterResponse?
    @Published var registerErrorMessage: String?
    
    private var authenticationService = MockAuthenticationService()
    
    func login() {
        let request = LoginRequest(email: email, password: password)
        authenticationService.login(request: request) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                                        self?.loginResponse = response
                                        self?.loginErrorMessage = nil
                                    case .failure(let error):
                                        self?.loginErrorMessage = error.localizedDescription
                    }
                }
            }
        }
    
    func register() {
        let request = RegisterRequest(
            firstName: firstName,
            lastName: lastName,
            password: password,
            passwordConfirm: passwordConfirm,
            email: registerEmail)
        
        authenticationService.register(request: request) { [weak self] result in
            switch result {
            case.success(let response):
                self?.registerResponse = response
                self?.registerErrorMessage = nil
            case.failure(let error):
                self?.registerErrorMessage = error.localizedDescription
            }
        }
    }
    
}

