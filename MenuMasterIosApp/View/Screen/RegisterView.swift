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
                backgroundImage
                
                VStack(alignment:.center) {
                    titleText
                    
                    VStack(alignment: .leading) {
                        
                        TextfieldView(title: "İsim Soyisim", placeholder: "Jane Doe", isPasswordField: false, text: $viewModel.fullName)
                        
                        TextfieldView(title: "E-posta", placeholder: "@janedoe.xamplemail.com", isPasswordField: false, text: $viewModel.email)
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre", placeholder: "Şifre", isPasswordField: !showPassword, text: $viewModel.password)
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(showPassword ? "eye" : "eye-slash")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.theme.titleColor)
                                    .opacity(0.5)
                                    .padding(.top, 25)
                                    .padding(.trailing, 20)
                            }
                        }
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre Tekrar", placeholder: "Şifre Tekrar", isPasswordField: !showPassword, text: $viewModel.confirmPassword)
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(showPassword ? "eye" : "eye-slash")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.theme.titleColor)
                                    .opacity(0.5)
                                    .padding(.top, 25)
                                    .padding(.trailing, 20)
                            }
                        }
                        
                    }.padding(.top,34)
                        .padding(.bottom,88)
                    
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
    
    private var backgroundImage : some View {
        Image("background-image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.5)
    }
    
    private var titleText : some View {
        Text("Kaydol")
            .foregroundColor(Color.theme.titleColor)
            .font(.chillaxVariable(size: 32))
            .fontWeight(.semibold)
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
            .foregroundColor(Color.theme.titleColor)
    }
    
}
