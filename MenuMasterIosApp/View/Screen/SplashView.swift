//
//  SplashView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/27/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var isAnimating = false
    @State private var isFadingOut = false
    
    var body: some View {
        if self.isActive {
            OnboardingTabView()
                .transition(.blurReplace)
        }else {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 147, height: 102)
                    .scaleEffect(isAnimating ? 1.0 : 0.5)
                    .opacity(isFadingOut ? 0.0 : 1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            isAnimating = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                            withAnimation(.easeInOut(duration: 0.4)) {
                                isFadingOut = true
                            }
                        }
                    }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    self.isActive = true
                }
            }
            
        }
        
    }
}

#Preview {
    SplashView()
}
