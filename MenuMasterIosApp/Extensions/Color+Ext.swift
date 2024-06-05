//
//  Color+Ext.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/22/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let primaryTextColor = Color("PrimaryTextColor")
    let textfieldBgColor = Color("TextfieldBgColor")
    
    let primaryOrangeColor = Color("PrimaryOrangeColor")
    let lightOrangeColor = Color("LightOrangeColor")
    let gradientLightOrangeColor = Color("GradientLightOrangeColor")
    
    let primaryGreenColor = Color("PrimaryGreenColor")
    let lightGreenColor = Color("LightGreenColor")
    
    let borderColor = Color("BorderColor")
    
    let mediumGrayTextColor = Color("MediumGrayTextColor")
    let lightBrownColor = Color("LightBrownColor")
    
    let customDarkTextColor = Color("CustomDarkTextColor")
    
}
