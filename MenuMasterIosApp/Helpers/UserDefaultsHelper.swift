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
        if let value = defaults.object(forKey: forKey.rawValue) as? T {
            return value
        } else if let arrayValue = defaults.array(forKey: forKey.rawValue) as? T {
            return arrayValue
        } else {
            return nil
        }
    }
    
    func removeData(key: UserDefaultKeys) {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    func printUserInformation() {
        for key in UserDefaultKeys.allCases {
            if let value = getData(type: [String].self, forKey: key) {
                print("\(key.rawValue.capitalized): \(value)")
            } else if let value = getData(type: String.self, forKey: key) {
                print("\(key.rawValue.capitalized): \(value)")
            } else {
                print("\(key.rawValue.capitalized): not set")
            }
        }
    }

}
