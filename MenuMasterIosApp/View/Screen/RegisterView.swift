//
//  RegisterView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/22/24.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @State private var showPassword: Bool = false
    @State private var loginTag: Bool = false
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                VStack(alignment:.center) {
                    titleText
                    
                    VStack(alignment: .leading) {
                        
                        TextfieldView(title: "İsim Soyisim", placeholder: "", isPasswordField: false, text: $viewModel.fullName)
                        
                        TextfieldView(title: "E-posta", placeholder: "", isPasswordField: false, text: $viewModel.email)
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre", placeholder: "", isPasswordField: !showPassword, text: $viewModel.password)
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(showPassword ? "eye" : "eye-slash")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.theme.primaryTextColor)
                                    .padding(.top, 25)
                                    .padding(.trailing, 20)
                            }
                        }
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre Tekrar", placeholder: "", isPasswordField: !showPassword, text: $viewModel.confirmPassword)
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(showPassword ? "eye" : "eye-slash")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.theme.primaryTextColor)
                                    .padding(.top, 25)
                                    .padding(.trailing, 20)
                            }
                        }
                        
                    }.padding(.top,34)
                        .padding(.bottom,88)
                    
                    Spacer()
                    
                    createAccountButton
                    redirectLoginPageButton
                    
                }
            }
            .navigationDestinationWrapper(isPresented: $viewModel.isAuthenticated, destination: {
                HomeView()
            })
            .navigationDestinationWrapper(isPresented: $loginTag, destination: {
                LoginView()
            })
        }
    }
}

#Preview {
    RegisterView()
}


extension RegisterView {
    
    
    private var titleText : some View {
        Text("Kaydol")
            .foregroundColor(Color.theme.primaryTextColor)
            .font(.chillaxVariable(size: 32))
            .fontWeight(.semibold)
            .padding(.top,80)
    }
    
    
    private var createAccountButton : some View {
        Button(action: {
            viewModel.register()
            //            viewModel.isAuthenticated = true // for test
        }) {
            Text("Hesap Oluştur")
                .customButtonStyle()
        }
        .padding(.bottom, 13)
    }
    
    private var redirectLoginPageButton : some View {
        HStack(spacing:3) {
            Text("Hesabın var mı?")
            Button(action: {
                // redirect login page
                loginTag = true
            }) {
                Text("Giriş Yap")
                    .underline()
                    .fontWeight(.bold)
            }
        }.font(.dmSans(size: 16))
            .foregroundColor(Color.theme.primaryTextColor)
    }
    
}
