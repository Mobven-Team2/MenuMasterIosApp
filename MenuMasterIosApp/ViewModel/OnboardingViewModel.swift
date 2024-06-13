//
//  OnboardingViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/13/24.
//

import Foundation
import SwiftUI


class OnboardingViewModel : ObservableObject {
    @Published var welcomeTag : Bool = false
    @Published var currentTab = 0
}
