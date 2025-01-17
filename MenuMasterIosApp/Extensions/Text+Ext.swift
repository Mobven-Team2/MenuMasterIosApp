//
//  Text+Ext.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/23/24.
//

import SwiftUI

extension Text {
    func formTitleStyle() -> some View {
        self
            .font(.poppins(size: 14))
            .foregroundColor(Color.theme.primaryTextColor)
    }
}
