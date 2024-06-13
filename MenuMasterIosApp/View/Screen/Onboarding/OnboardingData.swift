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
        OnboardingData(id: 0, objectImage: "onboarding1", primaryText: "Sana Özel Tarifler", secondaryText: "Beğenilerini ve beslenme tercihlerini gir, sana uygun tarifler keşfet"),
        OnboardingData(id: 1, objectImage: "onboarding2", primaryText: "Fotoğrafla Tarif Bul", secondaryText: "Yemeğin fotoğrafını çek, anında kişiselleştirilmiş tarif önerileri al."),
        OnboardingData(id: 2, objectImage: "onboarding3", primaryText: "Kolayca Öğün Planla", secondaryText: "Öğünlerini planla, her öğün için kişiselleştirilmiş tarifler al.")
    ]
}
