//
//  NetworkRequestType.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

typealias HTTPHeaders = [String: String]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

protocol NetworkRequestType {
    var baseUrl: URL { get }
    var path: String { get }
    var fullPath: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var queryParams: [String: String] { get }
    var headers: HTTPHeaders { get }
}
