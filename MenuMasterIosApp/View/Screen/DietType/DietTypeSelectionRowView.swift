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
    var description : String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Image(iconName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 26,height: 28)
                    .foregroundColor(Color.theme.primaryGreenColor)
                
                if self.description == "" {
                    Text(self.title)
                        .multilineTextAlignment(.leading)
                        .font(.poppins(size: 14))
                        .fontWeight(.bold)
                    
                }else {
                    VStack(alignment: .leading) {
                        Text(self.title)
                            .multilineTextAlignment(.leading)
                            .font(.poppins(size: 14))
                            .fontWeight(.bold)
                        
                        Text(self.description)
                            .multilineTextAlignment(.leading)
                            .font(.poppins(size: 14))
                            .fontWeight(.medium)
                        
                    }
                }
               
                Spacer()
                
                Image(systemName: self.isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(self.isSelected ? Color.theme.primaryGreenColor : Color.theme.textfieldBgColor)
                    .padding(.bottom,20)

            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 48, height: 72)
        }
        
        .background(self.isSelected ? Color.theme.lightGreenColor : .white)
        .foregroundColor(self.isSelected ? Color.theme.primaryGreenColor : Color.theme.primaryTextColor)
        .cornerRadius(16.0)
        .overlay(
            RoundedRectangle(cornerRadius: 16.0)
                .stroke(self.isSelected ? Color.theme.primaryGreenColor :Color.theme.borderColor,lineWidth: 1)
        )
        
    }
}

#Preview {
    DietTypeSelectionRowView(title: "Vegan", iconName: "vegan-icon", description: "Yalnızca Bitkisel", isSelected: false, action: {})
}
