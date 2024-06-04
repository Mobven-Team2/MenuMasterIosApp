//
//  UserUpdateRequestModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public struct UserUpdateRequestModel: Encodable {
    public var id: Int
    public var fullName: String
    public var email: String
    public var currentPassword: String
    public var newPassword: String
    public var age: Int
    public var height: Int
    public var weight: Int
    public var gender: String
    public var activityStatus: String
    public var dietTypes: [String]
    public var cuisineNames: [String]

    public init(id: Int, fullName: String, email: String, currentPassword: String, newPassword: String, age: Int, height: Int, weight: Int, gender: String, activityStatus: String, dietTypes: [String], cuisineNames: [String]) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.currentPassword = currentPassword
        self.newPassword = newPassword
        self.age = age
        self.height = height
        self.weight = weight
        self.gender = gender
        self.activityStatus = activityStatus
        self.dietTypes = dietTypes
        self.cuisineNames = cuisineNames
    }
}
