//
//  LoginView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/22/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State private var showPassword: Bool = false
    @State private var loginTag: Bool = false
    @State private var registerTag: Bool = false
    @State private var backButtonTag: Bool = false
    @State private var isButtonClickable: Bool = false
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                
                VStack(alignment:.center) {
                    backButton
                    titleText
                    
                    VStack(alignment: .leading) {
                        
                        TextfieldView(title: "E-posta", placeholder: "", isPasswordField: false, text: $viewModel.email)
                            .onChange(of: viewModel.email) {
                                isButtonClickable = viewModel.validateFields()
                            }
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre", placeholder: "", isPasswordField: !showPassword, text: $viewModel.password)
                                .onChange(of: viewModel.password) {
                                    isButtonClickable = viewModel.validateFields()
                                }
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(showPassword ? "eye" : "eye-slash")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(Color.theme.primaryTextColor)
                                    .padding(.top, 25)
                                    .padding(.trailing,20)
                            }
                        }
                        
                    }.padding(.top,34)
                    
                    forgetPasswordButton
                    Spacer()
                    loginButton
                    redirectRegisterPageButton
                    
                }
            }
            .navigationDestinationWrapper(isPresented: $loginTag, destination: {
                HomeView()
            })
            .navigationDestinationWrapper(isPresented: $registerTag, destination: {
                UserInformationView()
            })
            .navigationDestinationWrapper(isPresented: $backButtonTag, destination: {
                WelcomeView()
            })
        }
    }
}


#Preview {
    LoginView()
}


extension LoginView {
    
    private var titleText : some View {
        Text("Giriş Yap")
            .foregroundColor(Color.theme.primaryTextColor)
            .font(.chillaxVariable(size: 32))
            .fontWeight(.semibold)
            .padding(.top, 120)
    }
    
    private var forgetPasswordButton : some View {
        HStack(alignment: .bottom) {
            Spacer()
            Button(action: {
                // Şifreni mi unuttun?
            }) {
                Text("Şifreni mi Unuttun?")
                    .foregroundColor(Color.theme.primaryTextColor)
                    .underline()
                    .font(.dmSans(size: 12))
            }
        }
        .padding(.trailing, 35)
        .padding(.top, 20)
    }
    
    private var loginButton : some View {
        Button(action: {
            loginTag = viewModel.login()
            // TODO: backend gelince false iken hata mesajı yazdır
        }) {
            Text("Giriş Yap")
        }
        .customButtonStyle()
        .opacity(isButtonClickable ? 1 : 0.5)
        .padding(.bottom, 13)
    }
    
    private var redirectRegisterPageButton : some View {
        HStack(spacing:3) {
            Text("Hesabın yok mu?")
            Button(action: {
                registerTag = true
            }) {
                Text("Kaydol")
                    .underline()
                    .fontWeight(.bold)
            }
        }.font(.dmSans(size: 16))
            .padding(.bottom,20)
            .foregroundColor(Color.theme.primaryTextColor)
        
    }
    
    private var backButton : some View {
        Button(action: {
            backButtonTag = true
        }) {
            HStack() {
                Image("back-button-icon")
                    .resizable()
                    .foregroundColor(Color.theme.primaryTextColor)
                    .frame(width: 20,height: 32)
                    .padding(.leading, 20)
                
                Spacer()
            }
            
        }
    }
    
}

