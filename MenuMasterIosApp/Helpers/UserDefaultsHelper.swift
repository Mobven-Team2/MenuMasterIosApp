//
//  UserDefaultsHelper.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/8/24.
//

import Foundation

enum UserDefaultKeys: String, CaseIterable {
    case age
    case gender
    case height
    case weight
    case activityStatus
    case fullName
    case email
    case dietPreferences
    case selectedCuisines
    case selectedMeals
    case userId
    case accessToken
    case recipes
    case selectedIngredients
}

final class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    func setData<T>(value: T, key: UserDefaultKeys) {
        if let arrayValue = value as? [Any] {
            defaults.set(arrayValue, forKey: key.rawValue)
        } else {
            defaults.set(value, forKey: key.rawValue)
        }
    }
    
    func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
        if T.self == Array<Any>.self {
            return defaults.stringArray(forKey: forKey.rawValue) as? T
        } else if T.self == String.self {
            return defaults.string(forKey: forKey.rawValue) as? T
        } else if T.self == Int.self {
            return defaults.integer(forKey: forKey.rawValue) as? T
        } else if T.self == Bool.self {
            return defaults.bool(forKey: forKey.rawValue) as? T
        } else if T.self == Double.self {
            return defaults.double(forKey: forKey.rawValue) as? T
        } else {
            return defaults.object(forKey: forKey.rawValue) as? T
        }
    }
    
    
    func removeData(key: UserDefaultKeys) {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    func printUserInformation() {
        for key in UserDefaultKeys.allCases {
            if let stringArrayValue = getData(type: [String].self, forKey: key) {
                print("\(key.rawValue.capitalized): \(stringArrayValue.joined(separator: ", "))")
            } else if let stringValue = getData(type: String.self, forKey: key) {
                print("\(key.rawValue.capitalized): \(stringValue)")
            } else if let intValue = getData(type: Int.self, forKey: key) {
                print("\(key.rawValue.capitalized): \(intValue)")
            } else {
                print("\(key.rawValue.capitalized): not set")
            }
        }
    }

}
