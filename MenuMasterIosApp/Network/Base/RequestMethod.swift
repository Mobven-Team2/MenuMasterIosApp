//
//  RequestMethod.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

enum RequestMethod {
  case POST,GET,PUT,PATCH,DELETE
    
    var name:String {
        switch self {
        case .POST:
           return "POST"
        case .PUT:
           return "PUT"
        case .GET:
          return  "GET"
        case .PATCH:
          return  "PATCH"
        case .DELETE:
          return  "DELETE"
        }
    }
}
