//
//  AuthenticationService.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 23.05.2024.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage : String)
}

class AuthenticationService {
    
    func login(email: String, password: String,completion: @escaping (Result<String, AuthenticationError>) -> Void) async {
        
        let body = UserLoginRequestModel(email: email, password: password)
        do {
            let request = try await API.UserRequest.loginUser(body).request()
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    completion(.failure(.custom(errorMessage: "No data")))
                    return
                }
                
                guard let loginResponse = try? JSONDecoder().decode(UserLoginResponseModel.self, from: data) else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                print(loginResponse)
                guard let token = loginResponse.response else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                completion(.success(token))
                
            }.resume()
        }catch {
            print(AuthenticationError.custom(errorMessage: "login error"))
            return
        }
    }
    
    func register(fullName: String, password: String, passwordConfirm: String ,email: String, age: Int ,height: Int ,weight: Int, gender: String ,activityStatus: String ,dietTypes: [String], cuisineNames: [String],completion: @escaping (Result<String, AuthenticationError>) -> Void) async {
        
        let body = UserRegisterRequestModel(fullName: fullName, password: password, passwordConfirm: passwordConfirm, email: email, age: age, height: height, weight: weight, gender: gender, activityStatus: activityStatus, dietTypes: dietTypes, cuisineNames: cuisineNames)
        
        do {
            let request = try await API.UserRequest.registerUser(body).request()
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    completion(.failure(.custom(errorMessage: "No data")))
                    return
                }
                
                guard let registerResponse = try? JSONDecoder().decode(UserRegisterResponseModel.self, from: data) else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                print(registerResponse)
                
                guard let response = registerResponse.response else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                completion(.success(response))
                
            }.resume()
        }catch {
            print(AuthenticationError.custom(errorMessage: "register error"))
            return
        }
        

    }

    
    
}
