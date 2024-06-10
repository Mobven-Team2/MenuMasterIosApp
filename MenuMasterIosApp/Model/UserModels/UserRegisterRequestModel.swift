//
//  UserRegisterRequestModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/8/24.
//

import Foundation

public struct UserRegisterRequestModel: Codable {
    let email: String
    let password: String
    let passwordConfirm: String
    let fullName: String
    let age: Int
    let height: Int
    let weight: Int
    let gender: String
    let activityStatus: String
    let dietTypes: [String]
    let cuisineNames: [String]
    
    public init(email: String, password: String, passwordConfirm: String, fullName: String, age: Int, height: Int, weight: Int, gender: String, activityStatus: String, dietTypes: [String], cuisineNames: [String]) {
        self.email = email
        self.password = password
        self.passwordConfirm = passwordConfirm
        self.fullName = fullName
        self.age = age
        self.height = height
        self.weight = weight
        self.gender = gender
        self.activityStatus = activityStatus
        self.dietTypes = dietTypes
        self.cuisineNames = cuisineNames
    }
}

