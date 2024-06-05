//
//  WelcomeView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/27/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var loginTag: Bool = false
    @State private var userInfoTag: Bool = false
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                    
                VStack {
                    
                    Text("Hoşgeldin")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.chillaxVariable(size: 32))
                        .fontWeight(.semibold)
                    
                    Text("Tercihlerine göre beslenmenin tadını çıkar!")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.dmSans(size: 18))
                        .frame(width: 292,height: 50)
                        .lineLimit(5)
                        .multilineTextAlignment(.center)
                        .fontWeight(.regular)
                      
                    
                    Image("welcome")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 262, height: 262)
                        .padding(.bottom,80)
                        .padding(.top,50)
                    
                    Button(action: {
                        loginTag = true
                    }) {
                        Text("Giriş Yap")
                            .frame(width: UIScreen.main.bounds.width - 48, height: 56)
                    }
                    .customButtonStyle()
                    .padding(.bottom, 13)
                    
                    Button(action: {
                        userInfoTag = true
                    }) {
                        Text("Kaydol")
                            .frame(width: UIScreen.main.bounds.width - 48, height: 56)
                    }
                    .customButtonStyleLight()
                    
                }
            }
            .navigationDestinationWrapper(isPresented: $userInfoTag, destination: {
                UserInformationView()
            })
            .navigationDestinationWrapper(isPresented: $loginTag, destination: {
                LoginView()
            })
        }
    }
}

#Preview {
    WelcomeView()
}

