//
//  ProfileViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/13/24.
//

import Foundation

class ProfileViewModel : ObservableObject {
    var name : String = UserDefaultsHelper.shared.getData(type: String.self, forKey: .fullName) ?? "Jane Doe"
    var age : Int = UserDefaultsHelper.shared.getData(type: Int.self, forKey: .age) ?? 22
    var height : Int = UserDefaultsHelper.shared.getData(type: Int.self, forKey: .height) ?? 165
    var weight : Int = UserDefaultsHelper.shared.getData(type: Int.self, forKey: .weight) ?? 55

}
