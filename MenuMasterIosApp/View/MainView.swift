//
//  MainView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 7.06.2024.
//

import SwiftUI

struct MainView: View {
//    @StateObject var selectedTab = TabSelector()
    @State var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView()
                .tabItem {
                    Label("Ana Sayfa", systemImage: "1.circle")
                }
                .tag(0)
            
            MealSelectionView()
                .tabItem {
                    Label("Öğünler", systemImage: "2.circle")
                }
                .tag(1)
            
        }
        .toolbar(.hidden)
        .tabViewStyle(.automatic)
//        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
