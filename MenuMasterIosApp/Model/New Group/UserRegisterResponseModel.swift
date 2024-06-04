//
//  UserRegisterResponseModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import Foundation

public struct UserRegisterResponseModel: Codable {
    var response: String?
    
    public init(response: String) {
        self.response = response
    }
}
