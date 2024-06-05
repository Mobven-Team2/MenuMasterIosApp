//
//  OnboardingModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/5/24.
//

import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0, objectImage: "onboarding1", primaryText: "All your favorites", secondaryText: "Get all your loved foods in one once you just place the orer we do the rest"),
        OnboardingData(id: 1, objectImage: "onboarding2", primaryText: "Predict weather", secondaryText: "Predict weather trends and conditions with current solar activity."),
        OnboardingData(id: 2, objectImage: "onboarding3", primaryText: "Get air quality information", secondaryText: "Immediate, accurate air quality data to help you create healthier.")
    ]
}
