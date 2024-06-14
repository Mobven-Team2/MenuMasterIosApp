//
//  BaseUrl.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

extension NetworkRequestType {
    
    var baseUrl: URL {
        guard let apiUrl = URL(string: APPEnvironment.shared.environment.baseApiUrl) else {
            fatalError("API base URL note configured.")
        }
        return apiUrl
    }
    
    var fullPath: String {
        return APPEnvironment.shared.environment.baseApiUrl + self.path
    }
}
