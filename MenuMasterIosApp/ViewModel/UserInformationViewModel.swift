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
    
    init() {
        loadUserInformation()
    }
    
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
    
    func saveUserInformation() {
        UserDefaultsHelper.shared.setData(value: age, key: .age)
        if let gender = gender {
            UserDefaultsHelper.shared.setData(value: gender.rawValue, key: .gender)
        }
        UserDefaultsHelper.shared.setData(value: height, key: .height)
        UserDefaultsHelper.shared.setData(value: weight, key: .weight)
        if let activityStatus = activityStatus {
            UserDefaultsHelper.shared.setData(value: activityStatus.rawValue, key: .activityStatus)
        }
    }
    
    func loadUserInformation() {
        if let savedAge = UserDefaultsHelper.shared.getData(type: String.self, forKey: .age) {
            age = savedAge
        }
        if let savedGenderRawValue = UserDefaultsHelper.shared.getData(type: String.self, forKey: .gender),
           let savedGender = Gender(rawValue: savedGenderRawValue) {
            gender = savedGender
        }
        if let savedHeight = UserDefaultsHelper.shared.getData(type: String.self, forKey: .height) {
            height = savedHeight
        }
        if let savedWeight = UserDefaultsHelper.shared.getData(type: String.self, forKey: .weight) {
            weight = savedWeight
        }
        if let savedActivityStatusRawValue = UserDefaultsHelper.shared.getData(type: String.self, forKey: .activityStatus),
           let savedActivityStatus = ActivityStatus(rawValue: savedActivityStatusRawValue) {
            activityStatus = savedActivityStatus
        }
    }
    
    func areUserDefaultsFilled() -> Bool {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "age") != nil &&
               defaults.string(forKey: "gender") != nil &&
               defaults.string(forKey: "height") != nil &&
               defaults.string(forKey: "weight") != nil &&
               defaults.string(forKey: "activityStatus") != nil
    }
    
    
}
