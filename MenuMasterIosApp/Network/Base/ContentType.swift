//
//  ContentType.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

enum ContentType {
    case json
    case multipartFormData

    var rawValue: String{
        switch self {
        case .json:
            "application/json"
        case .multipartFormData:
            ""
        }
    }
}
