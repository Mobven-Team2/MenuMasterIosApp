//
//  HomeViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/5/24.
//

import Foundation
import SwiftUI


class HomeViewModel: ObservableObject {
    
    var topImage: String?
    
    let hour = Calendar.current.component(.hour, from: Date())
    
    func determineTime() -> String {
        if hour >= 5 && hour < 12 {
            topImage = "morning"
        } else if hour >= 12 && hour < 20 {
            topImage = "noon"
        } else {
            topImage = "night"
        }
        return topImage ?? "noon"
    }
}
