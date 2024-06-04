//
//  API.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public enum API {
    static func prepareUrl(withPath path: String) -> URL {
        guard let baseURL = Bundle.main.infoForKey("BASE_URL") else {
            fatalError("Could not create BaseURL")
            
        }
        
        guard let url = URL(string: "\(baseURL)\(path)") else {
            fatalError("Could not create url")
        }
        
        return url
    }
    
    static func getHeader(contentType: ContentType) -> [String: String] {
        var headers: [String: String] = [:]
        if let token = getAuthToken() {
            headers["Authorization"] = "Bearer \(token)"
        }
        headers["Content-Type"] = contentType.rawValue
        return headers
    }
    
    private static func getAuthToken() -> String? {
        return nil
    }

    
}
