//
//  IngredientsItemView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/12/24.
//

import Foundation
import SwiftUI

struct IngredientsItemView: View {
    var name: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        HStack {
            HStack() {
                Text(name)
                    .font(.poppins(size: 14))
                    .fontWeight(.medium)
                    .padding(.leading,22)
                Spacer()
                Image(systemName: self.isSelected ? "checkmark" : "")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.theme.primaryGreenColor)
                    .padding(.trailing,20)
            }
            .frame(width: UIScreen.main.bounds.width - 48, height: 48)
            .foregroundColor(Color.theme.customDarkTextColor)
            .background(isSelected ? Color.theme.lightGreenColor : Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(self.isSelected ? Color.theme.primaryGreenColor :.clear,lineWidth: 1)
            )
            .padding(.bottom,12)
            .onTapGesture {
                action()
            }
            
        }.padding(3)
    }
}

#Preview {
    IngredientsItemView(name: "Yumurta", isSelected: true, action: {})
}
