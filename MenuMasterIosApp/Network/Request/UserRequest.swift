//
//  UserRequest.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public extension API {
    enum UserRequest: Networkable {
        case registerUser(UserRegisterRequestModel)
        case loginUser(UserLoginRequestModel)
        case updateUserProfile(UserUpdateRequestModel)
        case getUserById(String)

        public func request() async throws -> URLRequest {
            switch self {
            case .registerUser(let userInfo):
                return try await postRequest(data: userInfo, path: Endpoint.registerUser.path)

            case .loginUser(let loginInfo):
                return try await postRequest(data: loginInfo, path: Endpoint.loginUser.path)

            case .updateUserProfile(let userInfo):
                return try await postRequest(data: userInfo, path: Endpoint.updateUserProfile.path)

            case .getUserById(let userId):
                return try await getRequest(path: Endpoint.getUserById(userID: Int(userId) ?? 0).path)
            }
        }
    }
}



