//
//  Response.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public struct Response<T: Decodable>: Decodable {
    public var results: T?
}
