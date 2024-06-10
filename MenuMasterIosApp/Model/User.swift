//
//  User.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/28/24.
//

import Foundation

struct User: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var password: String
    var passwordConfirm: String
    var email: String
    var age: Int
    var height: Int
    var weight: Int
    var gender: Gender
    var activityStatus: ActivityStatus
    var dietType: [DietType]
    var cuisineNames : [Cuisine]
}

enum Gender: String, Codable, CaseIterable , CustomStringConvertible, Identifiable {
    case female = "Kadın"
    case male = "Erkek"
    
    var description: String {
        switch self {
        case .male :
            return "Erkek"
        case .female:
            return "Kadın"
        }
    }
    
    var id: String { self.rawValue }
}


enum ActivityStatus: String, Codable, CaseIterable , CustomStringConvertible , Identifiable{
    
    case sedentary = "Hareketsiz"
    case lightlyActive = "HafifAktif"
    case moderatelyActive = "OrtaDereceAktif"
    case veryActive = "ÇokAktif"
    case extraActive = "AşırıAktif"
    
    var description: String {
        switch self {
        case .sedentary:
            return "Hareketsiz"
        case .lightlyActive:
            return "Hafif Aktif"
        case .moderatelyActive:
            return "Orta Derece Aktif"
        case .veryActive:
            return "Çok Aktif"
        case .extraActive:
            return "Aşırı Aktif"
        }
    }
    
    var id: String { self.rawValue }
}

enum DietType: String, Codable, CaseIterable , Identifiable{
    case vegan = "Vegan"
    case vegetarian = "Vegetarian"
    case ketogenic = "Ketogenic"
    case paleo = "Paleo"
    case noPreference = "NotSpecified"
    
    var iconName: String {
        switch self {
        case .vegan:
            return "vegan-icon"
        case .vegetarian:
            return "vegetarian-icon"
        case .ketogenic:
            return "ketogenic-icon"
        case .paleo:
            return "paleo-icon"
        case .noPreference:
            return "nopreference-icon"
        }
    }
    
    var description: String {
        switch self {
        case .vegan:
            return "Yalnızca Bitkisel"
        case .vegetarian:
            return "Bitkisel temelli, etsiz"
        case .ketogenic:
            return "Yağ Temelli"
        case .paleo:
            return "İlkel, doğal beslenme"
        case .noPreference:
            return ""
        }
    }
    
    var title: String {
        switch self {
        case .vegan:
            return "Vegan"
        case .vegetarian:
            return "Vejeteryan"
        case .ketogenic:
            return "Ketojenik"
        case .paleo:
            return "Paleo"
        case .noPreference:
            return "Beslenme Tercihim Yok"
        }
    }
    
    var id: String { self.rawValue }
}


enum Cuisine: String, Codable, CaseIterable , Identifiable{
    case turkish = "Türk"
    case mexican = "Meksikan"
    case french = "Fransız"
    case indian = "Hint"
    case greek = "Yunan"
    case mediterranean = "Akdeniz"
    case italian = "İtalyan"
    case balkan = "Balkan"
    case japanese = "Japon"
    case chinese = "Çin"
    case korean = "Kore"
    case vietnamese = "Vietnam"
    case thai = "Tayland"
    
    var id: String { self.rawValue }
}

