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
    @State private var registerTag: Bool = false
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                
                VStack(alignment:.center) {
                    titleText
                    
                    VStack(alignment: .leading) {
                        
                        TextfieldView(title: "E-posta", placeholder: "", isPasswordField: false, text: $viewModel.email)
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre", placeholder: "", isPasswordField: !showPassword, text: $viewModel.password)
                            
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
                    redirectSignUpPageButton
                    
                }
            }
            .navigationDestinationWrapper(isPresented: $viewModel.isAuthenticated, destination: {
                HomeView()
            })
            .navigationDestinationWrapper(isPresented: $registerTag, destination: {
                RegisterView()
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
            // login
            viewModel.login()
            //            viewModel.isAuthenticated = true // for test
        }) {
            Text("Giriş Yap")
        }
        .customButtonStyle()
        .padding(.bottom, 13)
    }
    
    private var redirectSignUpPageButton : some View {
        HStack(spacing:3) {
            Text("Hesabın yok mu?")
            Button(action: {
                // redirect register page
                registerTag = true
            }) {
                Text("Kaydol")
                    .underline()
                    .fontWeight(.bold)
            }
        }.font(.dmSans(size: 16))
            .foregroundColor(Color.theme.primaryTextColor)
        
    }
    
    
    
}

