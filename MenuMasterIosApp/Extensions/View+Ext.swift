//
//  View+Ext.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/23/24.
//

import SwiftUI

extension View {
    func customTextFieldStyle() -> some View {
        self
            .padding(.leading, 16)
            .font(.dmSans(size: 14))
            .foregroundColor(Color.theme.primaryTextColor)
            .frame(width: 327, height: 49)
            .background(Color.theme.textfieldBgColor)
            .cornerRadius(8.0)
            .shadow(color: Color.black.opacity(0.1), radius: 45, x: 0, y: 2)
    }
    
    func customButtonStyle() -> some View {
            self
                .font(.dmSans(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: 327, height: 56)
                .background(Color.theme.primaryOrangeColor)
                .cornerRadius(16.0)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    
    func customButtonStyleLight() -> some View {
            self
                .font(.dmSans(size: 16))
                .fontWeight(.medium)
                .foregroundColor(Color.theme.primaryOrangeColor)
                .frame(width: 327, height: 56)
                .background(Color.theme.lightOrangeColor)
                .cornerRadius(16.0)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    
}
