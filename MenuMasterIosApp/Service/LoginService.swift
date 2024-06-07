//
//  LoginService.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

class LoginService {

    // Post Request to login an User
    func loginUser(email: String, password: String,completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        print("Email: \(email), Password: \(password)")
        let request = UserAPI.loginUser(email: email, password: password)
        Networking.shared.request(request, type: UserLoginResponseModel.self, decodingType: .useDefaultKeys) { result in
            print("accessToken : ",result)
            switch result {
            case .success(let dataModel):
                // Handle Success Case
                print("Success")
                completion(.success(dataModel.accessToken ?? ""))
            case .failure(let error):
                if let err = error as? NetworkError {
                    switch err {
                    case .decodableFailure(let error):
                        // Handle Decodable Failure Case
                        print("Decodable Failure \(error)")
                        completion(.failure(.custom(errorMessage: "decoding error")))
                    default :
                        // Handle Other Failure Cases
                        print("Other Errors")
                        completion(.failure(.custom(errorMessage: "other error")))
                    }
                }
            }
        }
    }

}
