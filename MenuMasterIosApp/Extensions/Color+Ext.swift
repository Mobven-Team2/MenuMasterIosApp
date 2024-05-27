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
    let primaryOrangeColor = Color("PrimaryOrangeColor")
    let lightOrangeColor = Color("LightOrangeColor")
    let textfieldBgColor = Color("TextfieldBgColor")
}
