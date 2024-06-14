//
//  OnboardingTabView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/5/24.
//

import SwiftUI


struct OnboardingTabView: View {
    @ObservedObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        NavigationViewStack {
            VStack {
                TabView(selection: $viewModel.currentTab) {
                    ForEach(OnboardingData.list) { viewData in
                        OnboardingView(data: viewData, currentTab: $viewModel.currentTab, welcomeTag: $viewModel.welcomeTag)
                            .tag(viewData.id)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                VStack {
                    Button(action: {
                        withAnimation(.smooth) {
                            if viewModel.currentTab < OnboardingData.list.count - 1 {
                                viewModel.currentTab += 1
                            } else {
                                viewModel.welcomeTag = true
                            }
                        }
                    }) {
                        Text("İlerle")
                    }
                    .customButtonStyle()
                    .padding(.bottom, 18)
                    
                    Button(action: {
                        viewModel.welcomeTag = true
                    }) {
                        Text("Atla")
                            .font(.poppins(size: 16))
                            .foregroundColor(Color(red: 100 / 255, green: 105 / 255, blue: 130 / 255))
                    }
                }
                .padding(.bottom, 18)
            }
            .navigationDestinationWrapper(isPresented: $viewModel.welcomeTag, destination: {
                WelcomeView()
            })
        }
    }
}

#Preview {
    OnboardingTabView()
}
