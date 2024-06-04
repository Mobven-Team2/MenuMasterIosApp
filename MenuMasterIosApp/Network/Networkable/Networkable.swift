//
//  Networkable.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public protocol Networkable {
    func request() async throws -> URLRequest
}

public extension Networkable {
    func fetch<T: Decodable>(requestModel model: T.Type) async throws -> Result<T, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request(), delegate: nil)

            guard let response = response as? HTTPURLResponse else {
                return .failure(NSError.generic)
            }

            switch response.statusCode {

            case 401:
                // yeni token all
                return .failure(NSError.generic)

            default:
                if let json = try? JSONSerialization.jsonObject(with: data, options:  .mutableContainers),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                    print("---------------------------------")
                    print("---------------------------------")
                    print(String(decoding: jsonData, as: UTF8.self))
                    print("---------------------------------")
                    print("---------------------------------")
                }

                if model.self is Data.Type {
                    return .success(data as! T)
                }

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodingData = try decoder.decode(Response<T>.self, from: data)

                if let body = decodingData.results {
                    return .success(body)
                } else {
                    return .failure(NSError.generic)
                }
            }

        } catch {
            return .failure(NSError.generic)
        }
    }
    
    
    func create<T: Decodable>(data: Data, path: String) async -> Result<T, Error> {
        do {
            var request = try await prepareRequest(url: API.prepareUrl(withPath: path), method: .POST, contentType: .json)
            request.httpBody = data

            let (responseData, response) = try await URLSession.shared.upload(for: request, from: data, delegate: nil)

            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(NSError.generic)
            }

            switch httpResponse.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedData = try decoder.decode(T.self, from: responseData)
                return .success(decodedData)
            default:
                return .failure(NSError.generic)
            }
        } catch {
            return .failure(error)
        }
    }

}
