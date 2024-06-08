//
//  DietTypeViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/8/24.
//

import Foundation
import SwiftUI

class DietTypeViewModel: ObservableObject {
    @Published var selectedPreferences: [DietType] = []
    @Published var isContinueButtonTapped = false
    @Published var continueTag: Bool = false
    @Published var backButtonTag: Bool = false
    
    func savePreferences() {
        let dietPreferences: [String] = selectedPreferences.map { $0.rawValue }
        UserDefaultsHelper.shared.setData(value: dietPreferences ,key: .dietPreferences)
    }
    
    func toggleSelection(for dietType: DietType) {
        if dietType == .noPreference {
            selectedPreferences = selectedPreferences.contains(dietType) ? [] : [.noPreference]
        } else {
            if selectedPreferences.contains(dietType) {
                selectedPreferences.removeAll { $0 == dietType }
            } else {
                selectedPreferences.append(dietType)
                selectedPreferences.removeAll { $0 == .noPreference }
            }
        }
    }
    
    func continueButtonTapped() {
        isContinueButtonTapped = true
        savePreferences()
        continueTag = true
    }
}
