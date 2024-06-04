//
//  UserResponse.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

// MARK: - Result

struct GlobalFailureResponse: Codable {
    let type: String
    let title: String
    let status: Int
}
