//
//  UserInformationViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/28/24.
//

import Foundation

class UserInformationViewModel: ObservableObject {
    @Published var age: String = ""
    @Published var gender: Gender?
    @Published var height: String = ""
    @Published var weight: String = ""
    @Published var activityStatus: ActivityStatus?
    
    var isAnyFieldEmpty: Bool {
            return age.isEmpty || gender == nil || height.isEmpty || weight.isEmpty || activityStatus == nil
        }
    
}
