//
//  UserAPIRequest.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

// Enum defining User API requests
enum UserAPI {
    case registerUser(fullName: String,password:String, passwordConfirm: String, email: String, age: Int, height: Int, weight: Int, gender: String, activityStatus: String,dietTypes: [String],cuisineNames: [String])
    case loginUser(email: String, password: String)
    case updateUserProfile
    case getUserById(userID: Int)
    case updateUser(userID: Int)
    case getRecipes(id: Int, mealTypes : [String])

}

extension UserAPI: NetworkRequestType {

    // Endpoint path for each case
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
        case .getRecipes:
            return "/api/User/GetRecipes"
        }
    }
    
    // HTTP method for each case
    var method: HTTPMethod {
        switch self {
        case .getUserById, .getRecipes:
            return .get
        case .registerUser, .loginUser:
            return .post
        case .updateUser, .updateUserProfile:
            return .put
        }
    }
    
    
    // Parameters for each case
    var parameters: [String: Any]? {
        switch self {
        case .getUserById(userID: let userID):
            return [ "userID": userID]
        case .loginUser(email: let email, password: let password):
            return [ "email": email,
                     "password": password ]
        case .registerUser(fullName: let fullName, password: let password, passwordConfirm: let passwordConfirm, email: let email, age: let age, height: let height, weight: let weight, gender: let gender, activityStatus: let activityStatus, dietTypes: let dietTypes, cuisineNames: let cuisineNames):
            return [ "fullName": fullName,
                     "password": password,
                     "passwordConfirm": passwordConfirm,
                     "email": email,
                     "age": age,
                     "height": height,
                     "weight": weight,
                     "gender": gender,
                     "activityStatus": activityStatus,
                     "dietTypes": dietTypes,
                     "cuisineNames": cuisineNames ]
        case .updateUser(userID: let userID):
            return [ "userID": userID]
        case .updateUserProfile:
            return nil
        case .getRecipes(id: let id, mealTypes: let mealTypes):
            return [ "id": id,
                     "mealTypes": mealTypes ]
        }
    }
    
    // Headers for each case
    var headers: HTTPHeaders {
        var headers: HTTPHeaders = ["Content-Type": "application/json; charset=utf-8"]
        
        // Eğer auth token varsa:
        if let authToken = getAuthToken(), !authToken.isEmpty {
            headers["Authorization"] = "Bearer \(authToken)"
        }
        return headers
    }


    func getAuthToken() -> String? {
        let accessToken: String? = UserDefaultsHelper.shared.getData(type: String.self, forKey: .accessToken)
        return accessToken
    }
    
    // Query parameters for each case
    var queryParams: [String : String] {
        return [:]
    }
}


