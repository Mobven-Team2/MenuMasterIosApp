//
//  RegisterViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/23/24.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    private let registerService = AuthenticationService()

    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    var registerValidator = Validator()
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    

    
    func registerUser() async -> Bool {
        let isValid = validateFields()
        if !isValid {
            errorMessage = "Validation failed."
            return false
        }
        
        await registerService.register(
            fullName: fullName,
            password: password,
            passwordConfirm: confirmPassword,
            email: email,
            age: 12,
            height: 111,
            weight: 111,
            gender: Gender.female.rawValue,
            activityStatus: ActivityStatus.extraActive.rawValue,
            dietTypes: [DietType.ketogenic.rawValue],
            cuisineNames: [Cuisine.japanese.rawValue]
        ) { result in
            switch result {
            case .success(let message):
                print("Registration successful: \(message)")
                self.isAuthenticated = true // You may want to reconsider setting this here
            case .failure(let error):
                print("Registration error: \(error.localizedDescription)")
                self.errorMessage = "Registration failed: \(error.localizedDescription)"
                self.isAuthenticated = false // Set isAuthenticated to false in case of failure
            }
        }
        
        return true // This might need to be adjusted based on your requirements
    }


    
    func register(checkbox: Bool)  -> Bool {
        if isAuthenticated && checkbox {
            print("Kayıt başarılı!")
            return true
        }else {
            print("Kayıt başarısız!")
            return false
        }
    }
    
    func validateFields() -> Bool {
        return registerValidator.validateRegisterFields(fullName, email, password, confirmPassword)
    }
    
    func validateFullName() -> String {
        return registerValidator.validateFullName(fullName)
    }
    
    func validateEmail() -> String {
        return registerValidator.validateEmail(email)
    }
    
    func validatePassword() -> String {
        return registerValidator.validatePassword(password)
    }
    
    func validateConfirmPassword() -> String {
        return registerValidator.validateConfirmPassword(password, confirmPassword)
    }
}
