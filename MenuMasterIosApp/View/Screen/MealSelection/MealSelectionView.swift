//
//  MealSelectionView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import SwiftUI

struct MealSelectionView: View {
    @State private var selectedPreferences: Set<MealType> = []
    @State private var isButtonTapped: Bool = false
    @State private var backButtonTag: Bool = false
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                VStack(alignment:.center,spacing: 12) {
                    
                    backButton
                    
                    WeeklyCalendarView()
                    
                    HStack() {
                        Text("Öğün Seç")
                            .padding(.leading,20)
                            .fontWeight(.semibold)
                            .font(.poppins(size: 18))
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
            .navigationDestinationWrapper(isPresented: $backButtonTag, destination: {
                HomeView()
            })
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
    
    private var backButton : some View {
        Button(action: {
            backButtonTag = true
        }) {
            HStack() {
                Image("back-button-icon")
                    .resizable()
                    .foregroundColor(Color.theme.primaryTextColor)
                    .frame(width: 20,height: 32)
                    .padding([.top, .leading], 20)
                
                Spacer()
            }
            
        }
    }
}
