//
//  Validator.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 28.05.2024.
//

import Foundation

class Validator {
 
    var validator: ValidationError?
    
    func validateLoginFields(_ email: String, _ password: String) -> Bool {
        guard !email.isEmpty, !password.isEmpty else { return false }
        
        guard validateEmail(email).isEmpty else { return false }
        guard validatePassword(password).isEmpty else { return false }
        
        return true
    }
    
    func validateRegisterFields(_ fullName: String, _ email: String, _ password: String, _ confirmPassword: String) -> Bool {
        guard !fullName.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else { return false }
        
        guard validateFullName(fullName).isEmpty else { return false }
        guard validateEmail(email).isEmpty else { return false }
        guard validatePassword(password).isEmpty else { return false }
        guard validateConfirmPassword(password, confirmPassword).isEmpty else { return false }
        
        return true
    }
    
    func validateUserInformationFields(_ age: String, _ height: String, _ weight: String) -> Bool {
        guard !age.isEmpty, !height.isEmpty, !weight.isEmpty else { return false }
        
        guard validateAge(age).isEmpty else { return false }
        guard validateHeight(height).isEmpty else { return false }
        guard validateWeight(weight).isEmpty else { return false }
        
        return true
    }
    
    func validateFullName(_ fullName: String) -> String {
        if (fullName.count > 4 && fullName.count < 26) || fullName.isEmpty {
            validator = .noError
        } else {
            validator = .fullName
        }
        return validator?.errorMessage ?? ""
    }
    
    func validateEmail(_ email: String) -> String {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        if emailPredicate.evaluate(with: email) {
            validator = .noError
        } else {
            validator = .email
        }
        return validator?.errorMessage ?? ""
    }
    
    func validatePassword(_ password: String) -> String {
        let passwordRegex = "[0-9]{6,6}"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        if passwordPredicate.evaluate(with: password) {
            validator = .noError
        } else {
            validator = .password
        }
        return validator?.errorMessage ?? ""
    }
    
    func validateConfirmPassword(_ password: String, _ confirmPassword: String) -> String {
        if password == confirmPassword {
            validator = .noError
        } else {
            validator = .confirmPassword
        }
        return validator?.errorMessage ?? ""
    }
    
    func validateAge(_ age: String) -> String {
        let ageRegex = "[0-9]{2,2}"
        let agePredicate = NSPredicate(format:"SELF MATCHES %@", ageRegex)
        if agePredicate.evaluate(with: age) {
            validator = .noError
        } else {
            validator = .age
        }
        return validator?.errorMessage ?? ""
    }
    
    func validateHeight(_ height: String) -> String {
        let heightRegex = "[0-9]{3,3}"
        let heightPredicate = NSPredicate(format:"SELF MATCHES %@", heightRegex)
        if heightPredicate.evaluate(with: height) {
            validator = .noError
        } else {
            validator = .height
        }
        return validator?.errorMessage ?? ""
    }
    
    func validateWeight(_ weight: String) -> String {
        let weightRegex = "[0-9]{2,3}"
        let weightPredicate = NSPredicate(format:"SELF MATCHES %@", weightRegex)
        if weightPredicate.evaluate(with: weight) && Int(weight)! > 29 && Int(weight)! < 201 {
            validator = .noError
        } else {
            validator = .weight
        }
        return validator?.errorMessage ?? ""
    }
}

enum ValidationError {
    case fullName
    case email
    case password
    case confirmPassword
    case noError
    case empty
    case age
    case height
    case weight
    
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
        case .age:
            return "Eksik veya hatalı yazım."
        case .height:
            return "Eksik veya hatalı yazım."
        case .weight:
            return "Eksik veya hatalı yazım."
        }
    }
}
