//
//  MealTypeModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import Foundation

//struct MealType {
//    var name: String
//    var imageName: String
//    
//    static let breakfast = MealType(name: "Breakfast", imageName: "breakfast-card")
//    static let snack = MealType(name: "Snack", imageName: "snack-card")
//    static let dinner = MealType(name: "Dinner", imageName: "dinner-card")
//    static let lunch = MealType(name: "Lunch", imageName: "lunch-card")
//}

enum MealType: String, Codable, CaseIterable {
    case breakfast = "Breakfast"
    case snack = "Snack"
    case dinner = "Dinner"
    case lunch = "Lunch"
    
    
    var imageName: String {
        switch self {
        case .breakfast:
            return "breakfast-card"
        case .snack:
            return "snack-card"
        case .lunch:
            return "lunch-card"
        case .dinner:
            return "dinner-card"
            
        }
        
        
    }
}
