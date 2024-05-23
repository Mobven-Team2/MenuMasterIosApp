//
//  MockAuthenticationModel.swift
//  MenuMasterIosApp
//
//  Created by Barış Temiz on 23.05.2024.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password : String
}

struct LoginResponse: Codable {
    let accessToken: String
}

struct RegisterRequest: Codable {
    let firstName: String
    let lastName: String
    let password: String
    let passwordConfirm: String
    let email: String
}

struct RegisterResponse: Codable {
    let response: String
}
