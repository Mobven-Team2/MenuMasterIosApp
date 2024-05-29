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
    
    let primaryPurpleColor = Color("PrimaryPurpleColor")
    let lightPurpleColor = Color("LightPurpleColor")
}
