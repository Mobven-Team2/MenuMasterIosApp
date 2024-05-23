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
            .font(.dmSans(size: 14))
            .padding()
            .frame(width: 327, height: 49)
            .background(Color.white)
            .cornerRadius(25.0)
            .shadow(color: Color.black.opacity(0.1), radius: 45, x: 0, y: 2)
    }
    
    func customButtonStyle() -> some View {
            self
                .font(.dmSans(size: 16))
                .foregroundColor(.white)
                .frame(width: 327, height: 49)
                .background(Color.theme.greenColor)
                .cornerRadius(25.0)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    
}
