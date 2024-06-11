//
//  RegisterViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/23/24.
//

import Foundation
import JWTDecode

class RegisterViewModel: ObservableObject {
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var userId : String = ""
    var registerValidator = Validator()
    
    func register(checkbox: Bool) -> Bool {
        if isAuthenticated && checkbox {
            registerUser()
            print("Kayıt başarılı!")
            return true
        }else {
            print("Kayıt başarısız!")
            return false
        }
    }
    
    func registerUser(){
        guard let age = UserDefaultsHelper.shared.getData(type: Int.self, forKey: .age),
              let height = UserDefaultsHelper.shared.getData(type: Int.self, forKey: .height),
              let weight = UserDefaultsHelper.shared.getData(type: Int.self, forKey: .weight),
              let gender = UserDefaultsHelper.shared.getData(type: String.self, forKey: .gender),
              let activityStatus = UserDefaultsHelper.shared.getData(type: String.self, forKey: .activityStatus),
              let dietTypes = UserDefaultsHelper.shared.getData(type: [String].self, forKey: .dietPreferences),
              let cuisineNames = UserDefaultsHelper.shared.getData(type: [String].self, forKey: .selectedCuisines) else {
            print("Kayıt için gerekli bilgiler eksik!")
            return
        }
        
        let activityStatusString = activityStatus.replacingOccurrences(of: " ", with: "")
        
        let requestModel = UserRegisterRequestModel(
            email: email,
            password: password,
            passwordConfirm: confirmPassword,
            fullName: fullName,
            age: age,
            height: height,
            weight: weight,
            gender: gender,
            activityStatus: activityStatusString,
            dietTypes: dietTypes,
            cuisineNames: cuisineNames
        )
        
        
        RegisterService().registerUser(requestModel: requestModel) { result in
            switch result {
            case .success(let token):
                UserDefaultsHelper.shared.setData(value: token, key: .accessToken)
                JWTDecoderHelper.handleJWTToken(token) { userId in
                    if let userId = userId {
                        DispatchQueue.main.async {
                            self.userId = userId
                            UserDefaultsHelper.shared.setData(value: userId, key: .userId)
                            self.isAuthenticated = true
                        }
                    } else {
                        // Handle error
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("fail:")
                self.isAuthenticated = false
            }
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
    
    func saveUserInformation() {
        UserDefaultsHelper.shared.setData(value: fullName, key: .fullName)
        UserDefaultsHelper.shared.setData(value: email, key: .email)
        printUserInformation()
    }
    
    func printUserInformation() {
        UserDefaultsHelper.shared.printUserInformation()
    }
    
}
