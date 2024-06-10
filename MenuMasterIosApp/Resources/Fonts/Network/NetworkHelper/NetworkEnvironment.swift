//
//  NetworkEnvironment.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

enum EnvironmentType {
    case development
    case production
    
    var environment: Environment {
        switch self {
        case .development:
            return DEVEnvironment()
        case .production:
            return PRODEnvironment()
        }
    }
}

// MARK: - App Environment

protocol Environment {
    var environment: EnvironmentType { get }
    var baseApiUrl: String { get }
    // Add Other Keys here
}

private struct DEVEnvironment: Environment {
    var environment: EnvironmentType = .development
    var baseApiUrl: String = "https://talent.mobven.com:5042"

    init() {}
}

private struct PRODEnvironment: Environment {
    var environment: EnvironmentType = .production
    var baseApiUrl: String = "PRODUCTION URL"

    init() {}
}

class APPEnvironment {
    
    static let shared: APPEnvironment = APPEnvironment()
    let environment: Environment
    
    private init() {
        //change here
        let environmentType: EnvironmentType = .development
        self.environment = environmentType.environment
    }
}
