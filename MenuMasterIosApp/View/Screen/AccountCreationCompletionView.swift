//
//  AccountCreationCompletionView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/30/24.
//

import SwiftUI

struct AccountCreationCompletionView: View {
    @State private var homeTag: Bool = false
    @State private var isContinueButtonTapped = false
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                Image("account-completion-background-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                    .offset(x:-3)
                
                VStack {
                    Spacer()
                    
                    Image("account-completion-image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 262, height: 262)
                        .padding(.bottom,80)
                        .padding(.top,50)
                    
                    Text("Az kaldı, hesap oluşturmayı tamamlamak üzeresin!!")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.chillaxVariable(size: 22))
                        .frame(width: 292,height: 100)
                        .lineLimit(5)
                        .multilineTextAlignment(.center)
                        .fontWeight(.medium)
                    
                    CustomButtonView(text: "Devam Et", isButtonTapped: $isContinueButtonTapped) {
                        homeTag = true
                    }.padding(.vertical,60)
                    
                }
            }
            .navigationDestinationWrapper(isPresented: $homeTag, destination: {
                HomeView()
            })
        }
    }
}

#Preview {
    AccountCreationCompletionView()
}







