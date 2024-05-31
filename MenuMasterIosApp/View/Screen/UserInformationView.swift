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
    @State private var loginTag: Bool = false
    @State private var continueTag: Bool = false
    @State private var backButtonTag: Bool = false
    
    var body: some View {
        NavigationViewStack {
            VStack(alignment: .center) {
                VStack(alignment: .leading,spacing: 8){
                    
                    backButton
                    
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
                
                Spacer()
                
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
                    .frame(height: 450)
                    .padding(.bottom,30)
                
                
                CustomButtonView(text: "Devam Et", isButtonTapped: $isContinueButtonTapped) {
                    continueTag = true
                }.disabled(viewModel.isAnyFieldEmpty || isContinueButtonTapped)
                    .opacity((viewModel.isAnyFieldEmpty || isContinueButtonTapped) ? 0.5 : 1.0)
                
                redirectLoginPageButton
                
            }.navigationDestinationWrapper(isPresented: $continueTag, destination: {
                DietTypeView()
            })
            .navigationDestinationWrapper(isPresented: $loginTag, destination: {
                LoginView()
            })
            .navigationDestinationWrapper(isPresented: $backButtonTag, destination: {
                WelcomeView()
            })
            
        }
    }
}

#Preview {
    UserInformationView()
}


extension UserInformationView {
    
    private var redirectLoginPageButton : some View {
        HStack(spacing:3) {
            Text("Hesabın var mı?")
            Button(action: {
                loginTag = true
            }) {
                Text("Giriş Yap")
                    .underline()
                    .fontWeight(.bold)
            }
        }.font(.dmSans(size: 16))
            .foregroundColor(Color.theme.primaryTextColor)
    }
    
    private var backButton : some View {
        Button(action: {
            backButtonTag = true
        }) {
            Image("back-button-icon")
                .resizable()
                .foregroundColor(Color.theme.primaryTextColor)
                .frame(width: 20,height: 32)
                .padding(0)
        }
    }
}
