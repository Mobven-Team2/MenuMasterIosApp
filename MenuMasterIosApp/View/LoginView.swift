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
                
                backgroundImage
                
                VStack(alignment:.center) {
                    titleText
                    
                    VStack(alignment: .leading) {
                        Text("E-posta")
                            .formTitleStyle()
                        
                        TextField("@janedoe.xamplemail.com", text: $viewModel.email)
                            .customTextFieldStyle()
                            .textContentType(.emailAddress)
                        
                        Text("Şifre")
                            .formTitleStyle()
                        
                        ZStack(alignment:.trailing) {
                            if showPassword {
                                TextField("Şifre", text: $viewModel.password)
                                    .customTextFieldStyle()
                                
                            } else {
                                SecureField("Şifre", text: $viewModel.password)
                                    .customTextFieldStyle()
                            }
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(showPassword ? "eye" : "eye-slash")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(Color.theme.titleColor)
                                    .opacity(0.5)
                            }
                            .padding(.trailing, 16)
                        }
                        
                    }.padding(.top,34)
                    
                    forgetPasswordButton
                    loginButton
                    redirectSignUpPageButton
                
                }
            }
            .navigationDestinationWrapper(isPresented: $viewModel.isAuthenticated, destination: {
                Text("Giris Yap Basarili!")
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
    
    private var backgroundImage : some View {
        Image("background-image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.5)
    }
    
    private var titleText : some View {
        Text("Giriş Yap")
            .foregroundColor(Color.theme.titleColor)
            .font(.chillaxVariable(size: 32))
            .fontWeight(.semibold)
    }
    
    private var forgetPasswordButton : some View {
        HStack(alignment: .bottom) {
            Spacer()
            Button(action: {
                // Şifreni mi unuttun?
            }) {
                Text("Şifreni mi Unuttun?")
                    .foregroundColor(Color.theme.titleColor)
                    .underline()
                    .font(.dmSans(size: 12))
            }
        }
        .padding(.trailing, 27)
        .padding(.top, 20)
        .padding(.bottom, 13)
    }
    
    private var loginButton : some View {
        Button(action: {
            // login
            viewModel.login()
            viewModel.isAuthenticated = true // for test
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
            .foregroundColor(Color.theme.titleColor)
        
    }
    
    
    
}

