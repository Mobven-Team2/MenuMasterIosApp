//
//  UserRegisterResponseModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/8/24.
//

import Foundation

public struct UserRegisterResponseModel: Codable {
    var response : String?
        
    public init(response: String) {
        self.response = response
    }
}

//public struct UserRegisterResponseModel: Codable {
//    var type : String?
//    var title : String?
//    var status : Int?
//    var response : String?
//        
//    public init(type: String? = nil, title: String? = nil, status: Int? = nil, response: String?) {
//        self.type = type
//        self.title = title
//        self.status = status
//        self.response = response
//    }
//    
//}
