//
//  AccountCreationCompletionView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/30/24.
//

import SwiftUI

struct AccountCreationCompletionView: View {
    @State private var continueTag: Bool = false
    @State private var isContinueButtonTapped = false
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                
                VStack {
                    Spacer()
                    
                    Image("account-completion-image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 375, height: 418)
                        .padding(.top,50)
                    
                    Text("Az kaldı, hesap oluşturmayı tamamlamak üzeresin!")
                        .foregroundColor(Color.theme.customDarkTextColor)
                        .font(.poppins(size: 18))
                        .frame(width: 292,height: 100)
                        .lineLimit(5)
                        .multilineTextAlignment(.center)
                        
                    
                    CustomButtonView(text: "Devam Et", isButtonTapped: $isContinueButtonTapped) {
                        continueTag = true
                    }.padding(.vertical,60)
                    
                }
            }
            .navigationDestinationWrapper(isPresented: $continueTag, destination: {
                RegisterView()
            })
        }
    }
}

#Preview {
    AccountCreationCompletionView()
}







