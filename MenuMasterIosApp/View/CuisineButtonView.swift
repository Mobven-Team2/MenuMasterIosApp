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
                .foregroundColor(isSelected ? .white : Color.theme.primaryPurpleColor)
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(width: isLong ? (UIScreen.main.bounds.width ) * 2 / 4 : (UIScreen.main.bounds.width) * 1.5 / 4 ,height: 59)
            .background(isSelected ? Color.theme.primaryPurpleColor : Color.theme.lightPurpleColor)
            .cornerRadius(16)
    }
}

#Preview {
    CuisineButtonView(cuisine: .turkish, isSelected: true, isLong: true, action: {})
}
