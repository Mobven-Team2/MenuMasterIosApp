//
//  RegisterViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/23/24.
//

import Foundation

class RegisterViewModel: ObservableObject {

    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    var registerValidator = Validator()
    var isAuthenticated: Bool = false
    
    func register(checkbox: Bool) -> Bool {
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
    
    private func saveUserInformation() {
        UserDefaultsHelper.shared.setData(value: fullName, key: .fullName)
        UserDefaultsHelper.shared.setData(value: email, key: .email)
        // Do not save passwords in UserDefaults in a real application
    }
    
    func printUserInformation() {
        UserDefaultsHelper.shared.printUserInformation()
    }
    
}
