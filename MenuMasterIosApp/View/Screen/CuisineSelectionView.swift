//
//  CuisineSelectionView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/30/24.
//


import SwiftUI


struct CuisineSelectionView: View {
    @StateObject var viewModel = CuisineSelectionViewModel()
    @State private var isContinueButtonTapped = false
    @State private var isLong : Bool = false
    @State private var continueTag: Bool = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(),alignment: .leading),
        GridItem(.flexible(),alignment: .trailing),
    ]
    
    var body: some View {
        NavigationViewStack {
            VStack(alignment: .center) {
                
                VStack(alignment:.leading,spacing: 8) {
                    HStack {
                        Text("Favori Mutfağım...")
                            .foregroundColor(Color.theme.primaryTextColor)
                            .font(.chillaxVariable(size: 24))
                        .fontWeight(.medium)
                        
                        Spacer()
                    }
                    Text("En sevdiğin dünya mutfaklarını seç")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.dmSans(size: 14))
                        .lineSpacing(8)
                        .lineLimit(2)
                }.padding(.top,50)
                
                Spacer()
                
                
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.allCuisines.indices, id: \.self) { index in
                        let cuisine = viewModel.allCuisines[index]
                        let isLong = index % 4 == 1 || index % 4 == 2
                        
                        
                        HStack {
                            CuisineButtonView(cuisine: cuisine, isSelected: viewModel.selectedCuisines.contains(cuisine), isLong: isLong) {
                                viewModel.toggleCuisineSelection(cuisine)
                            }
                        }
                    }
                }
                
                Spacer()
                
                CustomButtonView(text: "Devam Et", isButtonTapped: $isContinueButtonTapped) {
                    continueTag = true
                }
                
            }
            .padding(.horizontal,20)
            .navigationDestinationWrapper(isPresented: $continueTag, destination: {
                    AccountCreationCompletionView()
                })
        }
        
        
    }
}


#Preview {
    CuisineSelectionView()
}
