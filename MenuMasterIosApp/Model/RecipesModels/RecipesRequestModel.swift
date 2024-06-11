//
//  RecipesRequestModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/11/24.
//

import Foundation

public struct RecipesRequestModel: Codable {
    let id: Int
    let mealTypes: [String]
    
    public init(id: Int, mealTypes: [String]) {
        self.id = id
        self.mealTypes = mealTypes
    }
}
