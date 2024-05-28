//
//  RegisterViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/23/24.
//

import Foundation

enum RegisterValidation {
    case fullName
    case email
    case password
    case confirmPassword
    case noError
    case empty
    
    var errorMessage: String {
        switch self {
        case .fullName:
            return "Lütfen 4 ila 25 karakter arası bir değer giriniz."
        case .email:
            return "Lütfen geçerli bir e-posta adresi giriniz."
        case .password:
            return "Sadece 6 haneli bir sayı girebilirsiniz."
        case .confirmPassword:
            return "Girdiğiniz şifreler uyuşmuyor. Tekrar deneyiniz."
        case .noError:
            return ""
        case .empty:
            return "Bu alan boş bırakılamaz."
        }
    }
}

class RegisterViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    @Published var registerValidator: RegisterValidation?
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    
    func register() -> Bool {
//        isAuthenticated = validateFields()
        if isAuthenticated {
            print("Kayıt başarılı!")
            return true
        }else {
            print("Kayıt başarısız!")
            return false
        }
    }
    
    func validateFields() -> Bool {
        var isValidated: Bool = true
        
        if fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            isValidated = false
            return isValidated
        }
        
        if !validateFullName() { isValidated = false }
        if !validateEmail() { isValidated = false }
        if !validatePassword() { isValidated = false }
        if !validateConfirmPassword() { isValidated = false }
        
        return isValidated
    }
    
    func validateFullName() -> Bool {
        if fullName.count > 25 || fullName.count < 4 {
            registerValidator = .fullName
            return false
        } else {
            registerValidator = .noError
            return true
        }
    }
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        if !emailPredicate.evaluate(with: email) {
            registerValidator = .email
            return false
        } else {
            registerValidator = .noError
            return true
        }
    }
    
    func validatePassword() -> Bool {
        let passwordRegex = "[0-9]{6,6}"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        if !passwordPredicate.evaluate(with: password) {
            registerValidator = .password
            return false
        } else {
            registerValidator = .noError
            return true
        }
    }
    
    func validateConfirmPassword() -> Bool {
        if password != confirmPassword {
            registerValidator = .confirmPassword
            return false
        } else {
            registerValidator = .noError
            return true
        }
    }
}
