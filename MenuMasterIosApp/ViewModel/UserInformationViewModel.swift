//
//  UserInformationViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/28/24.
//

import Foundation

class UserInformationViewModel: ObservableObject {
    @Published var age: String = ""
    @Published var gender: Gender?
    @Published var height: String = ""
    @Published var weight: String = ""
    @Published var activityStatus: ActivityStatus?
    
    var userInformationValidator = Validator()
    var isAuthenticated: Bool = false
    
    func validateFields() -> Bool {
        if gender == nil || activityStatus == nil {
            return false
        } else {
            return userInformationValidator.validateUserInformationFields(age, height, weight)
        }
    }
    
    func validateAge() -> String {
        return userInformationValidator.validateAge(age)
    }
    
    func validateHeight() -> String {
        return userInformationValidator.validateHeight(height)
    }
    
    func validateWeight() -> String {
        return userInformationValidator.validateWeight(weight)
    }
}
