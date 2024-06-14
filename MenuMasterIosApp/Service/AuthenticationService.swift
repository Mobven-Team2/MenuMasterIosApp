//
//  AuthenticationService.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 23.05.2024.
//

import Foundation

//struct LoginRequestBodyAuth: Codable {  // TODO: Belki bunlar model klasörüne taşınabilir
//    let email: String
//    let password: String
//}
//
//struct LoginAuthResponse: Codable {
//    let access_token: String?
//}

enum ServiceError: Error {
    case invalidCredentials
    case custom(errorMessage : String)
}

//class AuthenticationService {
//    
//    func login(email: String, password: String,completion: @escaping (Result<String, AuthenticationError>) -> Void) {
//        
//        guard let url = URL(string: "urlExample") else {
//            completion(.failure(.custom(errorMessage: "URL is not correct")))
//            return
//        }
//        
//        let body = LoginRequestBodyAuth(email: email, password: password)
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//            guard let data = data, error == nil else {
//                completion(.failure(.custom(errorMessage: "No data")))
//                return
//            }
//            
//            guard let loginResponse = try? JSONDecoder().decode(LoginAuthResponse.self, from: data) else {
//                completion(.failure(.invalidCredentials))
//                return
//            }
//            // print(loginResponse)
//            guard let token = loginResponse.access_token else {
//                completion(.failure(.invalidCredentials))
//                return
//            }
//            
//            completion(.success(token))
//            
//        }.resume()
//    }
//}
