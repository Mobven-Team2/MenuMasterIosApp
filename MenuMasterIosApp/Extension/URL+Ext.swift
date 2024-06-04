//
//  URL+Ext.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public extension URL {
//    func adding(parameters: [String: String]) -> URL {
//        guard parameters.count > 0 else {return self}
//        var queryItems: [URLQueryItem] = []
//        for parameter in parameters {
//            queryItems.append(URLQueryItem(name: parameter.key, value: parameter.value))
//        }
//         return adding(queryItems: queryItems)
//    }
//
//    private func adding(queryItems: [URLQueryItem]) -> URL {
//        guard var urlComponents = URLComponents(string: absoluteString) else {
//            fatalError("Could not create URLComponents")
//        }
//
//        urlComponents.queryItems = queryItems
//        guard let url = urlComponents.url else {
//            fatalError("Could not create URL")
//        }
//        return url
//    }
    
    func addingParameters(parameters: [String: String]) -> URL {
        guard parameters.count > 0 else {return self}
        var queryItems: [URLQueryItem] = []
        for parameter in parameters {
            queryItems.append(URLQueryItem(name: parameter.key, value: parameter.value))
        }
         return addingQueryItems(queryItems: queryItems)
    }

    private func addingQueryItems(queryItems: [URLQueryItem]) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else {
            fatalError("Could not create URLComponents")
        }

        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            fatalError("Could not create URL")
        }
        return url
    }
}
