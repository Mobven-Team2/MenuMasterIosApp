//
//  MealCardView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import SwiftUI

struct MealCardView: View {
    var name: String
    var imageName: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 82, height: 74)
                .padding(.leading,20)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                
                Text("Öğünü Ekle")
                    .foregroundStyle(Color.theme.mediumGrayTextColor)
            }
           
            Spacer()
            
            Image(systemName: self.isSelected ? "checkmark" : "")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.theme.primaryGreenColor)
                .padding(.trailing,20)
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 70)
        .padding(.vertical,16)
        .foregroundColor(Color.theme.darkTextColor)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    MealCardView(name: "Kahvaltı", imageName: "breakfast-card", isSelected: true, action: {})
}
