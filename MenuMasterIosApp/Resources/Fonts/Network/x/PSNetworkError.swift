//
//  PSNetworkError.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

enum PSNetworkError: Error {
    case noInternet
    case badRequest
    case invalidUrl(urlString: String)
    case unauthorized
    case urlSessionFailed(_ error: URLError)
    case forbidden
    case notFound
    case serverError
    case decodableFailure(Error)
    case error4xx(_ code: Int)
    case error5xx(_ code: Int)
    case unknownError
}
