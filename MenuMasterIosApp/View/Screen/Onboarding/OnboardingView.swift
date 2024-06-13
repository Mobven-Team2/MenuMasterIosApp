//
//  Onboarding.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/5/24.
//

import SwiftUI

struct OnboardingView: View {
    var data: OnboardingData
    @Binding var currentTab: Int
    @State private var welcomeTag: Bool = false
    @State private var isAnimating: Bool = false
    @State private var isNextButtonTapped: Bool = false
    
    var body: some View {
        NavigationViewStack {
            VStack(spacing: 10) {
                Image(data.objectImage)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    .scaledToFit()
                    .scaleEffect(isAnimating ? 1 : 0.8)
//                    .offset(y: -20)
                Spacer()
                Text(data.primaryText)
                    .bold()
                    .font(.poppins(size: 24))
                    .foregroundStyle(Color.theme.customDarkTextColor)
                
                Text(data.secondaryText)
                    .font(.poppins(size: 16))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 350)
                    .foregroundColor(Color.theme.customDarkTextColor)
                Spacer()
                HStack(spacing: 8) {
                    ForEach(OnboardingData.list.indices, id: \.self) { index in
                        Circle()
                            .fill(index == currentTab ? Color.theme.primaryOrangeColor : Color.theme.lightOrangeColor)
                            .frame(width: 10, height: 10)
                            
                    }
                }
                .padding(.bottom,50)

                Button(action: {
                    withAnimation(.smooth) {
                        isNextButtonTapped = true
                        if currentTab < OnboardingData.list.count - 1 {
                            currentTab += 1
                        }else {
                            welcomeTag = true
                        }
                    }
                }) {
                    Text("İlerle")
                }
                .customButtonStyle()
                .padding(.bottom, 18)
                
                Button(action: {
                    welcomeTag = true
                }, label: {
                    Text("Atla")
                        .font(.poppins(size: 16))
                        .foregroundColor(Color(red: 100 / 255, green: 105 / 255, blue: 130 / 255))
                    
                })
                
                
            }
            .navigationDestinationWrapper(isPresented: $welcomeTag, destination: {
                    WelcomeView()
                })
            .onAppear(perform: {
                isAnimating = true
                withAnimation(.easeOut(duration: 0.5)) {
                    self.isAnimating = true
                }
        })
        }
        .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)
            .safeAreaPadding(0)
    }
}

#Preview {
    OnboardingView(data: OnboardingData.list.first!, currentTab: .constant(0))
}
