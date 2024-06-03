//
//  DietTypeSelectionRowView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/29/24.
//

import SwiftUI

struct DietTypeSelectionRowView: View {
    var title: String
    var iconName: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                    .multilineTextAlignment(.leading)
                    .font(.dmSans(size: 16))
                    .fontWeight(.medium)
                
                Spacer()
                
                Image(iconName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 26,height: 28)
                    .foregroundColor(isSelected ? .white : Color.theme.primaryPurpleColor)
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 48, height: 64)
        }
        .background(self.isSelected ? Color.theme.primaryPurpleColor : Color.theme.lightPurpleColor)
        .foregroundColor(self.isSelected ? .white : Color.theme.primaryTextColor)
        .cornerRadius(16.0)
    }
}

#Preview {
    DietTypeSelectionRowView(title: "Vegan", iconName: "vegan-icon", isSelected: false, action: {})
}
