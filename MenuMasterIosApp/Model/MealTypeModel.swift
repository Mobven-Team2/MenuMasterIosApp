//
//  MealTypeModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import Foundation

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
