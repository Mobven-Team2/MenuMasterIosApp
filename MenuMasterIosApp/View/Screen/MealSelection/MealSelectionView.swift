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
    @State private var recipeDetailTag: Bool = false
    @State private var backButtonTag: Bool = false
    
    var body: some View {
        NavigationViewStack {
            ScrollView {
                VStack(spacing: 12) {
                    HStack() {
                        backButton
                        
                        Spacer()
                        
                        Text("Öğün Oluştur")
                            .font(.poppins(size: 18))
                            .fontWeight(.medium)
                            .padding(.trailing, 40)
                        
                        Spacer()
                        
                    }.padding(.bottom,-12)
                    
                    Spacer()
                    
                    WeeklyCalendarView()
                        .padding(.bottom,15)
                    
                    
                    ForEach(MealType.allCases, id: \.self) { mealType in
                        MealCardView(name: mealType.title, imageName: mealType.imageName, isSelected: self.selectedPreferences.contains(mealType)
                        ) {
                            self.toggleSelection(for: mealType)
                            
                        }
                    }
                    
                    CustomButtonView(text: "Öğünleri Oluştur", isButtonTapped: $isButtonTapped) {
                        UserDefaultsHelper.shared.setData(value: selectedPreferences.map { $0.rawValue }, key: .selectedMeals)
                        UserDefaultsHelper.shared.printUserInformation()
                        recipeDetailTag = true
                    }.opacity(selectedPreferences.isEmpty ? 0.5 : 1)
                        .disabled(selectedPreferences.isEmpty ? true : false)
                    
                    Spacer()
                }.padding(.top,60)
            }.navigationDestinationWrapper(isPresented: $recipeDetailTag, destination: {
                RecipeDetailView(recipes : [],isCreateButtonTapped: true)
            })
            .navigationDestinationWrapper(isPresented: $backButtonTag, destination: {
                MainView()
            })
            .toolbar(.hidden)
            
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
                    .padding(.leading, 20)
                
            }
            
        }
    }
}
