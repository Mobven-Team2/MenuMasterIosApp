//
//  UserRegisterResponseModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/8/24.
//

import Foundation

public struct UserRegisterResponseModel: Codable {
    var accessToken : String?
        
    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
