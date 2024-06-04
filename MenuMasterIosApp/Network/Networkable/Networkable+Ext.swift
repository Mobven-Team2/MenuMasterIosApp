//
//  Networkable+Ext.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

extension Networkable {
    func getRequest(
        queryItem: [String: String] = [:],
        path: String,
        httpMethod: RequestMethod = .GET
    ) async -> URLRequest {
        var url = API.prepareUrl(withPath: path)
//        url.append(queryItems: [.init(name: "api_key", value: "a9682a1bcb1c6843474a121144fd9071")])
        return prepareRequest(
            url: url,
            method: httpMethod,
            contentType: ContentType.json
        )
    }
    
    
    func postRequest<T: Encodable>(data: T, path: String, httpMethod: RequestMethod = .POST) async throws -> URLRequest {
          var url = API.prepareUrl(withPath: path)
          let bodyData = try JSONEncoder().encode(data)
          var request = prepareRequest(
              url: url,
              method: httpMethod,
              contentType: ContentType.json
          )
          request.httpBody = bodyData
          return request
      }
    
    func prepareRequest(url: URL, method: RequestMethod, contentType: ContentType) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        request.allHTTPHeaderFields = API.getHeader(contentType: contentType)
        return request
    }
}

