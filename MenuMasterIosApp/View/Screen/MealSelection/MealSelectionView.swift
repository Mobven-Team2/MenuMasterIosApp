//
//  MealSelectionView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import SwiftUI

struct MealSelectionView: View {
    @State private var selectedPreferences: Set<MealType> = []
    @State private var isButtonTapped = false
    
    var body: some View {
        VStack(alignment:.center,spacing: 12) {
            WeeklyCalendarView()
            
            HStack() {
                Text("Öğün Seç")
                    .padding(.leading,20)
                    .fontWeight(.semibold)
                    .font(.title3)
//                    .font(.poppins(size: 20))
                Spacer()
            }
            
            ForEach(MealType.allCases, id: \.self) { mealType in
                MealCardView(name: mealType.rawValue, imageName: mealType.imageName, isSelected: self.selectedPreferences.contains(mealType)) {
                    self.toggleSelection(for: mealType)
                }
            }
            
            CustomButtonView(text: "Ekle", isButtonTapped: $isButtonTapped) {
                //
            }.opacity(selectedPreferences.isEmpty ? 0.5 : 1)
                .disabled(selectedPreferences.isEmpty ? true : false)
        }
    }
}

#Preview {
    MealSelectionView()
}

extension MealSelectionView {
    private func toggleSelection(for mealType: MealType) {
        if selectedPreferences.contains(mealType) {
            selectedPreferences.remove(mealType)
        } else {
            selectedPreferences.insert(mealType)
        }
    }
}
