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
            .font(.poppins(size: 14))
            .foregroundColor(Color.theme.primaryTextColor)
            .frame(width: UIScreen.main.bounds.width - 48, height: 49)
            .background(Color.theme.textfieldBgColor)
            .cornerRadius(8.0)
            .textInputAutocapitalization(.never)
    }
    
    func customButtonStyle() -> some View {
        self
            .font(.poppins(size: 16))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 48, height: 56)
            .background(Color.theme.primaryOrangeColor)
            .cornerRadius(16.0)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
    func customButtonStyleLight() -> some View {
        self
            .font(.poppins(size: 16))
            .fontWeight(.medium)
            .foregroundColor(Color.theme.primaryOrangeColor)
            .frame(width: UIScreen.main.bounds.width - 48, height: 56)
            .background(.white)
            .cornerRadius(16.0)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 16.0)
                    .stroke(Color.theme.primaryOrangeColor, lineWidth: 1)
            )
        
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
