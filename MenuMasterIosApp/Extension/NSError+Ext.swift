//
//  NSError+Ext.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation

public extension NSError {
    static var generic: Error {
        NSError(domain: "", code: -1, userInfo: [:] )
    }

    static func genericError(message: String) -> NSError {
        NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
