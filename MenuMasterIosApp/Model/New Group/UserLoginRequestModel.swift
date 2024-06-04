//
//  UserLoginRequestModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public struct UserLoginRequestModel: Encodable {
    let email: String
    let password: String
    
    public init(email: String, password: String) {
         self.email = email
         self.password = password
     }
}
