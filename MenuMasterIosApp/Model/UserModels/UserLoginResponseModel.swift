//
//  UserLoginResponseModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

public struct UserLoginResponseModel: Codable {
    var accessToken : String?
        
    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
