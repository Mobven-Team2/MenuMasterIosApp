//
//  OnboardingTabView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/5/24.
//

import SwiftUI

import SwiftUI

struct OnboardingTabView: View {
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            ForEach(OnboardingData.list) { viewData in
                OnboardingView(data: viewData, currentTab: $currentTab)
                    .tag(viewData.id)
                    .transition(.move(edge: .leading))
                    
            }
        })
        
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

#Preview {
    OnboardingTabView()
}
