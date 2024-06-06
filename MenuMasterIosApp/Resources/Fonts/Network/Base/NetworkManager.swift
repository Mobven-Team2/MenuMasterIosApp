////
////  NetworkManager.swift
////  MenuMasterIosApp
////
////  Created by Cansu Özdizlekli on 6/6/24.
////
//
//import Foundation
//import Combine
//
//protocol NetworkService {
//    func request<T: Decodable>(_ endpoint: Endpoint, headers: [String: String]?, parameters: Encodable?) -> AnyPublisher<T, APIError>
//}
//
//class NetworkManager: NetworkService {
//    private let baseURL: String
//
//    init(environment: APIEnvironment = NetworkManager.defaultEnvironment()) {
//        self.baseURL = environment.baseURL
//    }
//
//    static func defaultEnvironment() -> APIEnvironment {
//#if DEBUG
//        return .development
//#else
//        return .production
//#endif
//    }
//
//    private func defaultHeaders() -> [String: String] {
//        var headers: [String: String] = [
//            "Platform": "iOS",
//            "User-Token": "your_user_token",
//            "uid": "user-id"
//        ]
//
//        if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
//            headers["App-Version"] = appVersion
//        }
//
//        return headers
//    }
//
//    func request<T: Decodable>(_ endpoint: Endpoint, headers: [String: String]? = nil, parameters: Encodable? = nil) -> AnyPublisher<T, APIError> {
//            guard let url = URL(string: baseURL + endpoint.path) else {
//                return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
//            }
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = endpoint.httpMethod.rawValue
//            let allHeaders = defaultHeaders().merging(headers ?? [:], uniquingKeysWith: { (_, new) in new })
//                for (key, value) in allHeaders {
//                    urlRequest.setValue(value, forHTTPHeaderField: key)
//            }
//            if let parameters = parameters {
//                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                do {
//                    let jsonData = try JSONEncoder().encode(parameters)
//                    urlRequest.httpBody = jsonData
//                } catch {
//                    return Fail(error: APIError.requestFailed("Encoding parameters failed.")).eraseToAnyPublisher()
//                }
//            }
//            return URLSession.shared.dataTaskPublisher(for: urlRequest)
//                .tryMap { (data, response) -> Data in
//                    if let httpResponse = response as? HTTPURLResponse,
//                       (200..<300).contains(httpResponse.statusCode) {
//                        return data
//                    } else {
//                        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
//                        throw APIError.requestFailed("Request failed with status code: \(statusCode)")
//                    }
//                }
//                .decode(type: ResponseWrapper<T>.self, decoder: JSONDecoder())
//                .tryMap { (responseWrapper) -> T in
//                    guard let status = responseWrapper.status else {
//                        throw APIError.requestFailed("Missing status.")
//                    }
//                    switch status {
//                    case 200:
//                        guard let data = responseWrapper.data else {
//                            throw APIError.requestFailed("Missing data.")
//                        }
//                        return data
//                    default:
//                        let message = responseWrapper.message ?? "An error occurred."
//                        throw APIError.requestFailed(message)
//                    }
//                }
//                .mapError { error -> APIError in
//                    if error is DecodingError {
//                        return APIError.decodingFailed
//                    } else if let apiError = error as? APIError {
//                        return apiError
//                    } else {
//                        return APIError.requestFailed("An unknown error occurred.")
//                    }
//                }
//                .eraseToAnyPublisher()
//        }
//}
