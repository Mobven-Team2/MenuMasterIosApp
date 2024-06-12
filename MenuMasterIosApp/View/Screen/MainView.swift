//
//  MainView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 7.06.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var tabSelector = TabSelector()
    
    var body: some View {
        TabView(selection: $tabSelector.selectedTab) {
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

            ShoppingListView()
                .tabItem {
                    Image("tab-shopping").renderingMode(.template)
                    Text("Alışveriş Listesi")
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
    }
}

#Preview {
    MainView()
}
