//
//  MainView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 7.06.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var tabSelector = TabSelector()
    @State var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView()
                .tabItem {
                    Image("tab-home").renderingMode(.template)
                    Text("Ana Sayfa")
                }
                .tag(0)
            
            MealSelectionView()
                .tabItem {
                    Image("tab-meal").renderingMode(.template)
                    Text("Öğünler")
                }
                .tag(1)
            RecipeDetailView(recipes : [])
                .tabItem {
                    Image("tab-recipe").renderingMode(.template)
                    Text("AI Tarifler")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image("tab-profile").renderingMode(.template)
                    Text("Profilim")
                }
                .tag(3)
            
        }
        .environmentObject(tabSelector)
        .accentColor(Color.theme.primaryOrangeColor)
        .onAppear {
            currentTab = tabSelector.selectedTab
        }
//        .onChange(of: tabSelector.selectedTab) {
//            currentTab = tabSelector.selectedTab
//        }
        .toolbar(.hidden)
        .tabViewStyle(.automatic)
//        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
