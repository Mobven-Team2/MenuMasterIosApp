//
//  UrlRequest.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

extension PSNetworkRequestType {
    
    func asURLRequest() throws -> URLRequest {
        let requestURL: URL!
        // If condition checks if we have passed the Whole path or not
        
        if path.contains("http") {
            requestURL = try path.asURL()
        } else {
            requestURL = try baseUrl.absoluteString.appending(path).asURL()
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        
        if headers.isEmpty {
            print("Headers are empty")
        } else {
            headers.forEach {
                request.setValue($0.value, forHTTPHeaderField: $0.key)
            }
        }
        
//        headers.forEach({
//            request.setValue($0.value, forHTTPHeaderField: $0.key)
//        })
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Query Parameters
        if !queryParams.isEmpty {
            var queryItemArr: [URLQueryItem] = []
            for item in queryParams {
                queryItemArr.append(URLQueryItem(name: item.key, value: item.value))
            }
            request.url?.append(queryItems: queryItemArr)
        }
        
        // HTTP Post Parameters
        if let parameters = parameters, !parameters.isEmpty {
            let paramData = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
            request.httpBody = paramData
        }
        
        return request
    }
}

extension String {
    func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw PSNetworkError.invalidUrl(urlString: self) }
        return url
    }
}
