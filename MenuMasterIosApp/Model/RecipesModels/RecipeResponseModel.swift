//
//  RecipesResponseModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/11/24.
//

import Foundation

public struct RecipeResponseModel : Codable , Hashable{
    let id : Int
    let name : String
    let ingredients : [String]
    let recipe : String
    let mealType : String
    let isLiked : Bool
    
    public init(id: Int, name: String, ingredients: [String], recipe: String, mealType: String, isLiked: Bool) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.recipe = recipe
        self.mealType = mealType
        self.isLiked = isLiked
    }
    
    public var mealTypeName: String {
        switch mealType {
        case "Breakfast":
            return "Kahvaltı"
        case "Snack":
            return "Atıştırmalık"
        case "Lunch":
            return "Öğle Yemeği"
        case "Dinner":
            return "Akşam Yemeği"
        default:
            return mealType
        }
    }
    
}
