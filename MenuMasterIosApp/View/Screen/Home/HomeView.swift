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
                            .padding(.horizontal,24)
                    }
                    
                    VStack{
                        pickMeal
                        
                        Button(action: {
                            tabSelector.selectedTab = 1
                        }) {
                            showMeal
                        }
                        .font(.poppins(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.primaryTextColor)
                        .frame(width: UIScreen.main.bounds.width - 48, height: 55)
                        .background(Color.theme.fullWhiteColor)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.bottom, 8)
                        
                        suggestion
                    }
                    .offset(y: -120)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.top)
            .navigationDestinationWrapper(isPresented: $mealSelectionTag, destination: {
                MealSelectionView()
           
        })
        }.ignoresSafeArea()
            .edgesIgnoringSafeArea(.top)

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
                    .font(.poppins(size: 18))
                    .foregroundStyle(Color.theme.customDarkTextColor)
                    .fontWeight(.regular)
                Text(viewModel.name)
                    .foregroundStyle(Color.theme.customDarkTextColor)
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
            VStack {
                Image("top-card")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width + 40, height: UIScreen.main.bounds.height / 2.3)
                .scaledToFit()
            }
            
            VStack {
                Text("Öğün Seç & Tarifleri Al")
                    .font(.poppins(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 285, height: 24, alignment: .leading)
                    .lineLimit(1)
                    .padding(.leading, 4)
                Text("Tarif almak istediğin öğünleri seç, yapay zekanın sana özel hazırladığı tariflere göz at")
                    .font(.poppins(size: 14))
                    .frame(width: 285, height: 63, alignment: .leading)
                    .lineLimit(3)
                HStack {
                    Spacer()
                    Button(action: {
                        isButtonTapped = true
                        mealSelectionTag = true
                    }) {
                        Text("Öğün Oluştur")
                            .frame(width: 120, height: 56, alignment: .leading)
                            .lineLimit(1)
                        Image(systemName: "chevron.right")
                            .offset(x: -16)
                    }
                    .font(.poppins(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.primaryOrangeColor)
                    .frame(width: 150, height: 56, alignment: .trailing)
                    .background(Color.theme.fullWhiteColor)
                    .cornerRadius(8)
                    .padding(.trailing, 50)
//                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.top, 80)
        }
        .padding(.bottom, -40)
    }
    
    private var showMeal : some View {
        HStack {
            Image("spaghetti")
                .frame(width: 40, height: 40)
                .padding(.leading, 10)
            
            Text("Öğünlerini Gör")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .padding(.leading, 10)
                .padding(.trailing, 32)
        }
    }
    
    private var suggestion : some View {
        VStack {
            Text("Yemek Tarifleri İçin Püf Noktalar")
                .font(.poppins(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 45)
                .padding(.bottom, 2)
            
            HomeSuggestionView(imageName: "suggestion-first", text: "Yemeğinizi pişirirken süreyi dikkatlice takip etmeyi unutmayın", backgroundColor: Color.theme.suggestionRedColor)
            
            HomeSuggestionView(imageName: "suggestion-second", text: "Yemeğinizi pişirirken süreyi dikkatlice takip etmeyi unutmayın", backgroundColor: Color.theme.suggestionGreenColor)
        }
    }
}
