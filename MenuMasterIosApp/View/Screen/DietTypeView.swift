//
//  DietTypeView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/29/24.
//

import SwiftUI

struct DietTypeView: View {
    @State private var selectedPreferences: Set<DietType> = []
    @State private var isContinueButtonTapped = false
    @State private var continueTag: Bool = false
    @State private var backButtonTag: Bool = false
    
    var body: some View {
        NavigationViewStack {
            VStack(alignment:.leading) {
                backButton
                VStack(alignment: .leading,spacing: 8){
                    Text("Beslenme tercihim...")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.chillaxVariable(size: 24))
                        .fontWeight(.medium)
                    
                    Text("Tariflerini istediğin beslenme türlerini seç.")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.dmSans(size: 14))
                        .lineSpacing(8)
                        .lineLimit(2)
                }.padding(.top,50)
                
                Form {
                    VStack(spacing:20) {
                        ForEach(DietType.allCases, id: \.self) { dietType in
                            DietTypeSelectionRowView(
                                title: dietType.rawValue,
                                iconName: dietType.iconName, description: dietType.description,
                                isSelected: self.selectedPreferences.contains(dietType)
                            ) {
                                self.toggleSelection(for: dietType)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .formStyle(.columns)
                .frame(height: 500)
                
                Spacer()
                
                CustomButtonView(text: "Devam Et", isButtonTapped: $isContinueButtonTapped) {
                   continueTag = true
                }
                
            }
            .navigationDestinationWrapper(isPresented: $continueTag, destination: {
                CuisineSelectionView()
            })
            .navigationDestinationWrapper(isPresented: $backButtonTag, destination: {
                UserInformationView()
            })
        }
    }
}



#Preview {
    DietTypeView()
}

extension DietTypeView {
    private func toggleSelection(for dietType: DietType) {
        if dietType == .noPreference {
            selectedPreferences = selectedPreferences.contains(dietType) ? [] : [.noPreference]
        } else {
            if selectedPreferences.contains(dietType) {
                selectedPreferences.remove(dietType)
            } else {
                selectedPreferences.insert(dietType)
                selectedPreferences.remove(.noPreference)
            }
        }
    }
    
    private var backButton : some View {
        Button(action: {
            backButtonTag = true
        }) {
            Image("back-button-icon")
                .resizable()
                .foregroundColor(Color.theme.primaryTextColor)
                .frame(width: 20,height: 32)
                .padding(0)
        }
    }
}
