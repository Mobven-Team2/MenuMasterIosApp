//
//  PSNetworking.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation
import Combine

protocol PSNetworkService: AnyObject {
    func request<T: Decodable>(_ request: PSNetworkRequestType, type: T.Type, decodingType: JSONDecoder.KeyDecodingStrategy, completion: @escaping (Result<T, Error>) -> Void)
}

final class PSNetworking: PSNetworkService {

    static let shared: PSNetworkService = PSNetworking()
    
    private var decoder: JSONDecoder = JSONDecoder()
    
    private var session: URLSession = URLSession.shared
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private init() {}
    
    func request<T>(_ request: PSNetworkRequestType, type: T.Type, decodingType: JSONDecoder.KeyDecodingStrategy, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        if !Reachability.isConnectedToNetwork() {
            completion(.failure(PSNetworkError.noInternet))
        }
        
        // Assign Decoding Strategy
        self.decoder.keyDecodingStrategy = decodingType
        
        var networkRequest: URLRequest?
        
        do {
            networkRequest = try request.asURLRequest()
        } catch {
            return completion(.failure(PSNetworkError.badRequest))
        }
        
        URLSession.shared.dataTaskPublisher(for: networkRequest!)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw PSNetworkError.unknownError
                }
                if response.statusCode > 399 {
                    throw self.httpError(response.statusCode)
                }
                return output.data
            }
            .decode(type: type, decoder: decoder)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completionResponse in
                switch completionResponse {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    completion(.failure(self.handleError(error)))
                }
            }, receiveValue: { data in
                completion(.success(data))
            }).store(in: &self.cancellableSet)
    }
    
    private func httpError(_ statusCode: Int) -> PSNetworkError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default: return .unknownError
        }
    }
    
    private func handleError(_ error: Error) -> PSNetworkError {
        switch error {
        case is Swift.DecodingError:
            if let decodingError = error as? DecodingError {
                debugPrint(">>>>>>>> \(decodingError)")
                return .decodableFailure(decodingError)
            }
            return .decodableFailure(error)
        case let urlError as URLError:
            return .urlSessionFailed(urlError)
        case let error as PSNetworkError:
            return error
        default:
            return .unknownError
        }
    }
    
    private func debugPrint(_ log: String) {
        #if DEBUG
        print(log)
        #endif
    }
}
