//
//  Endpoint.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

protocol Endpoints {
    var path: String { get }
}

enum Endpoint : Endpoints{
    case registerUser
    case loginUser
    case updateUserProfile
    case getUserById(userID: Int)
    case updateUser(userID: Int)
    
    var path: String {
        switch self {
        case .updateUser(let userID):
            return "/api/users/\(userID)"
        case .registerUser:
            return "/api/User/Register"
        case .loginUser:
            return "/api/User/Login"
        case .updateUserProfile:
            return "/api/User/Update"
        case .getUserById(let userID):
            return "/api/User/Get/\(userID)"
        }
    }
}
