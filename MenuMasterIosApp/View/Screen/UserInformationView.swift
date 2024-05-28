//
//  WelcomeView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/27/24.
//

import SwiftUI

struct UserInformationView: View {
    @StateObject var viewModel = UserInformationViewModel()
    @State private var isContinueButtonTapped = false
    
    var body: some View {
        NavigationViewStack {
            
            VStack(alignment: .center) {
                
                VStack(alignment: .leading,spacing: 8){
                    Text("Bilgilerini Gir")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.chillaxVariable(size: 24))
                        .fontWeight(.semibold)
                    
                    Text("Yemek tariflerini sana özel olarak hazırlayabilmemiz için aşağıdaki bilgileri doldurmalısın.")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.dmSans(size: 14))
                        .lineSpacing(8)
                        .lineLimit(2)
                    
                }.frame(width: UIScreen.main.bounds.width - 39)
                
                Form {
                    VStack(spacing: 20) {
                        TextfieldView(title: "Yaş", placeholder: "", isPasswordField: false, text: $viewModel.age)
                        
                        CustomPickerView(title: "Cinsiyet", selection: $viewModel.gender, options: Gender.allCases, placeholder: "")
                        
                        TextfieldView(title: "Boy", placeholder: "CM", isPasswordField: false, text: $viewModel.height)
                        
                        TextfieldView(title: "Kilo", placeholder: "KG", isPasswordField: false, text: $viewModel.weight)
                        
                        CustomPickerView(title: "Aktivite Durumu", selection: $viewModel.activityStatus, options: ActivityStatus.allCases, placeholder: "")
                    }
                    
                }.scrollContentBackground(.hidden)
                    .formStyle(.columns)
                    .frame(height: 480)
                    .padding(.bottom,40)
                
                
                continueButton
                
                redirectLoginPageButton
                
            }
            
        }
    }
}

#Preview {
    UserInformationView()
}


extension UserInformationView {
    private var continueButton : some View {
        Button(action: {
            isContinueButtonTapped = true
            // simulate a delay before navigating to the other view
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
            }
        }) {
            if !isContinueButtonTapped {
                Text("Devam Et")
            } else {
                ProgressView()
            }
        }
        .customButtonStyle()
        .padding(.bottom, 18)
        .disabled(viewModel.isAnyFieldEmpty || isContinueButtonTapped)
        .opacity((viewModel.isAnyFieldEmpty || isContinueButtonTapped) ? 0.5 : 1.0)
    }
    
    private var redirectLoginPageButton : some View {
        HStack(spacing:3) {
            Text("Hesabın var mı?")
            Button(action: {
                // redirect login page
                //                loginTag = true
            }) {
                Text("Giriş Yap")
                    .underline()
                    .fontWeight(.bold)
            }
        }.font(.dmSans(size: 16))
            .padding(.bottom,20)
            .foregroundColor(Color.theme.primaryTextColor)
    }
}
