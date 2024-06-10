//
//  DietTypeView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/29/24.
//

import SwiftUI

struct DietTypeView: View {
    @StateObject private var viewModel = DietTypeViewModel()
    
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
                        .font(.poppins(size: 14))
                        .lineSpacing(8)
                        .lineLimit(2)
                }.padding(.top,50)
                
                Form {
                    VStack(spacing:20) {
                        ForEach(DietType.allCases, id: \.self) { dietType in
                            DietTypeSelectionRowView(
                                title: dietType.title,
                                iconName: dietType.iconName, description: dietType.description,
                                isSelected: viewModel.selectedPreferences.contains(dietType)
                            ) {
                                self.viewModel.toggleSelection(for: dietType)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .formStyle(.columns)
                .frame(height: 500)
                
                Spacer()
                
                CustomButtonView(text: "Devam Et", isButtonTapped:  $viewModel.isContinueButtonTapped) {
                    viewModel.continueButtonTapped()
                }
                
            }
            .navigationDestinationWrapper(isPresented: $viewModel.continueTag, destination: {
                CuisineSelectionView()
            })
            .navigationDestinationWrapper(isPresented: $viewModel.backButtonTag, destination: {
                UserInformationView()
            })
        }
    }
}



#Preview {
    DietTypeView()
}

extension DietTypeView {
    private var backButton : some View {
        Button(action: {
            viewModel.backButtonTag = true
        }) {
            Image("back-button-icon")
                .resizable()
                .foregroundColor(Color.theme.primaryTextColor)
                .frame(width: 20,height: 32)
                .padding(0)
        }
    }
}
