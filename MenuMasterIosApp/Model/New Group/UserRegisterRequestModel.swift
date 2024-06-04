//
//  UserRegisterRequestModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public struct UserRegisterRequestModel: Encodable {
    var fullName: String
    var password: String
    var passwordConfirm: String
    var email: String
    var age: Int
    var height: Int
    var weight: Int
    var gender: String
    var activityStatus: String
    var dietTypes: [String]
    var cuisineNames: [String]
    
    public init(fullName: String, password: String, passwordConfirm: String, email: String, age: Int, height: Int, weight: Int, gender: String, activityStatus: String, dietTypes: [String], cuisineNames: [String]) {
        self.fullName = fullName
        self.password = password
        self.passwordConfirm = passwordConfirm
        self.email = email
        self.age = age
        self.height = height
        self.weight = weight
        self.gender = gender
        self.activityStatus = activityStatus
        self.dietTypes = dietTypes
        self.cuisineNames = cuisineNames
    }
}
