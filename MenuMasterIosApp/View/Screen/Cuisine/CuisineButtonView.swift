//
//  CuisineButtonView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/30/24.
//

import SwiftUI

struct CuisineButtonView: View {
    let cuisine: Cuisine
    let isSelected: Bool
    let isLong : Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(cuisine.rawValue)
                .font(.poppins(size: 16))
                .fontWeight(.medium)
            
            if self.isSelected {
                Image(systemName: "checkmark")
                    .opacity(self.isSelected ? 1 : 0)
            }
            
        }.frame(width: isLong ? (UIScreen.main.bounds.width ) * 2 / 4 : (UIScreen.main.bounds.width) * 1.5 / 4 ,height: 59)
            .background(self.isSelected ? Color.theme.lightGreenColor : .white)
            .foregroundColor(Color.theme.primaryGreenColor)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16.0)
                    .stroke(Color.theme.primaryGreenColor,lineWidth: 1)
            )
            .opacity(self.isSelected ? 1 : 0.6)
    }
}

#Preview {
    CuisineButtonView(cuisine: .turkish, isSelected: true, isLong: true, action: {})
}
