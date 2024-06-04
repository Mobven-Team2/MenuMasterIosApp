//
//  UserLoginResponseModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public struct UserLoginResponseModel: Codable {
    var response : String?
        
    public init(response: String) {
        self.response = response
    }
}
