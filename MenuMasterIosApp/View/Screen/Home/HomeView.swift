//
//  HomeView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 24.05.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var tabSelector: TabSelector
    @ObservedObject var viewModel = HomeViewModel()
    @State private var mealSelectionTag: Bool = false
    @State private var isButtonTapped: Bool = false
    
    var body: some View {
        NavigationViewStack {
            ScrollView {
                VStack {
                    ZStack {
                        Image(viewModel.getImageName())
                            .resizable()
                            .scaledToFit()
                        
                        helloUser
                    }
                    
                    VStack{
                        pickMeal
                        suggestion
                    }
                    .offset(y: -90)
                    
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationDestinationWrapper(isPresented: $mealSelectionTag, destination: {
                MealSelectionView()
                    
        })
        }

    }
}

#Preview {
    MainView()
}

extension HomeView {
    private var helloUser : some View {
        HStack {
            Image("user-avatar")
                .padding(.leading, 27)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text("Merhaba, hoşgeldin")
                    .foregroundStyle(Color.theme.primaryTextColor)
                    .font(.body)
                    .fontWeight(.light)
                Text("Jane Doe")
                    .foregroundStyle(Color.theme.primaryTextColor)
                    .font(.body)
                    .fontWeight(.bold)
            }
            Spacer()
            
            Image("bell")
                .frame(width: 42, height: 42)
                .padding(.trailing, 27)
        }
    }
    
    private var pickMeal : some View {
        ZStack {
            Image("top-card")
                .resizable()
            
            VStack(alignment: .leading) {
                Text("Öğün Seç & Tarifleri Al")
                    .font(.poppins(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 285, height: 24, alignment: .leading)
                    .lineLimit(1)
                    .padding(.leading, 4)
                Text("Tarif almak istediğin öğünleri seç, yapay zekanın sana özel hazırladığı tariflere göz at")
                    .font(.poppins(size: 14))
                    .frame(width: 285, height: 63)
                    .lineLimit(3)
                Button(action: {
                    isButtonTapped = true
                    mealSelectionTag = true
                }) {
                    Text("Öğün Oluştur")
                }
                .font(.poppins(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 96, height: 56)
                .background(Color.theme.primaryOrangeColor)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
            .padding(.top, 80)
        }
        .padding(.bottom, -40)
    }
    
    private var suggestion : some View {
        VStack {
            Text("Yemek Tarifleri İçin Püf Noktalar")
                .font(.poppins(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 36)
                .padding(.bottom, 2)
            
            HomeSuggestionView(imageName: "suggestion-first", text: "Yemeğinizi pişirirken süreyi dikkatlice takip etmeyi unutmayın", backgroundColor: Color.theme.suggestionRedColor)
            
            HomeSuggestionView(imageName: "suggestion-second", text: "Yemeğinizi pişirirken süreyi dikkatlice takip etmeyi unutmayın", backgroundColor: Color.theme.suggestionGreenColor)
        }
    }
}
