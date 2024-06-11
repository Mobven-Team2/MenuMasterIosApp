//
//  RegisterService.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/8/24.
//

import Foundation

class RegisterService {
    
    // Post Request to register an User
    func registerUser(requestModel: UserRegisterRequestModel,completion: @escaping (Result<String, ServiceError>) -> Void) {
        
        let request = UserAPI.registerUser(
            fullName: requestModel.fullName,
            password: requestModel.password,
            passwordConfirm: requestModel.passwordConfirm,
            email: requestModel.email,
            age: requestModel.age,
            height: requestModel.height,
            weight: requestModel.weight,
            gender: requestModel.gender,
            activityStatus: requestModel.activityStatus,
            dietTypes: requestModel.dietTypes,
            cuisineNames: requestModel.cuisineNames
        )
        
        Networking.shared.request(request, type: UserRegisterResponseModel.self, decodingType: .useDefaultKeys) { result in
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
