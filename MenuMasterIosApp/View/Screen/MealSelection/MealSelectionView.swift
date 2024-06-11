//
//  MealSelectionView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import SwiftUI

struct MealSelectionView: View {
    @ObservedObject var viewModel = MealSelectionViewModel()
    @State private var selectedPreferences: Set<MealType> = []
    @State private var isButtonTapped = false
    
    var body: some View {
        VStack(alignment:.center,spacing: 10) {
            Text("Öğün Oluştur")
                .font(.poppins(size: 18))
                .fontWeight(.semibold)
            WeeklyCalendarView()
                
                
            HStack() {
                Text("Öğün Seçimi Yap")
                    .padding(.leading,20)
                    .fontWeight(.semibold)
                    .font(.poppins(size: 18))
                Spacer()
            }
            
            ForEach(MealType.allCases, id: \.self) { mealType in
                MealCardView(name: mealType.rawValue, imageName: mealType.imageName, isSelected: self.selectedPreferences.contains(mealType)
                ) {
                    self.toggleSelection(for: mealType)
                    
                }
            }
            
            CustomButtonView(text: "Öğünleri Oluştur", isButtonTapped: $isButtonTapped) {
                UserDefaultsHelper.shared.setData(value: selectedPreferences.map { $0.rawValue }, key: .selectedMeals)
                UserDefaultsHelper.shared.printUserInformation()
                viewModel.getRecipes()
            }.opacity(selectedPreferences.isEmpty ? 0.5 : 1)
                .disabled(selectedPreferences.isEmpty ? true : false)
            
            Spacer()
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
