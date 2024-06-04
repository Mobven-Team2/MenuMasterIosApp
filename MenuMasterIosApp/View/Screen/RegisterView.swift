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
    @State private var registerTag: Bool = false
    @State private var backButtonTag: Bool = false
    @State private var isOn: Bool = false
    
    //Validation error messages
    @State private var errorFullName: String = ""
    @State private var errorEmail: String = ""
    @State private var errorPassword: String = ""
    @State private var errorConfirmPassword: String = ""
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                VStack(alignment:.center) {
                    backButton
                    titleText
                    
                    VStack(alignment: .leading) {

                        TextfieldView(title: "İsim Soyisim", placeholder: "", isPasswordField: false, errorMessage: errorFullName, text: $viewModel.fullName)
                            .onChange(of: viewModel.fullName) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                errorFullName = viewModel.validateFullName()
                            }
                        
                        TextfieldView(title: "E-posta", placeholder: "", isPasswordField: false, errorMessage: errorEmail, text: $viewModel.email)
                            .onChange(of: viewModel.email) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                errorEmail = viewModel.validateEmail()
                            }
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre", placeholder: "", isPasswordField: !showPassword, errorMessage: errorPassword, text: $viewModel.password)
                                .onChange(of: viewModel.password) {
                                    viewModel.isAuthenticated = viewModel.validateFields()
                                    errorPassword = viewModel.validatePassword()
                                    errorConfirmPassword = viewModel.validateConfirmPassword()
                                }
                            
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

                            TextfieldView(title: "Şifre Tekrar", placeholder: "", isPasswordField: !showPassword, errorMessage: errorConfirmPassword, text: $viewModel.confirmPassword)
                                .onChange(of: viewModel.confirmPassword) {
                                    viewModel.isAuthenticated = viewModel.validateFields()
                                    errorConfirmPassword = viewModel.validateConfirmPassword()
                                }
                            
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
                        
                    }.padding(.top, 10)
                        .padding(.bottom, 10)
                    
                    Spacer()
                    termsConditionsText
                    createAccountButton
                    redirectLoginPageButton
                    
                }
            }
            .navigationDestinationWrapper(isPresented: $registerTag, destination: {
                HomeView()
            })
            .navigationDestinationWrapper(isPresented: $loginTag, destination: {
                LoginView()
            })
            .navigationDestinationWrapper(isPresented: $backButtonTag, destination: {
                WelcomeView() // TODO: Dünya Mutfağı sayfasına dönmeli?
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
            .padding(.top, 50)
    }
    
    private var termsConditionsText : some View {
        HStack {
            Toggle("", isOn: $isOn)
                .toggleStyle(CheckboxToggleStyle(isOn: isOn))
            
            Text("\(Text("Şartlar & Koşullar").underline()) ve \(Text("Gizlilik Politikasını").underline()) kabul ediyorum.")
                .foregroundColor(isOn ? .black : .red)
                .font(.dmSans(size: 14))
                .frame(width: 287, height: 40)
                .multilineTextAlignment(.leading)
                .lineSpacing(0)
                .lineLimit(2)
        }
        .padding(2)
    }
    
    private var createAccountButton : some View {
        Button(action: {
            Task {
                let registrationResult = await viewModel.registerUser()
                if registrationResult {
                    // Registration was successful
                    viewModel.register(checkbox: true)
                    registerTag = true
                } else {
                    // Registration failed
                    // Handle the failure, show an alert, etc.
                }
            }

        }) {
            Text("Hesap Oluştur")
                .customButtonStyle()
                .opacity((viewModel.isAuthenticated && isOn) ? 1 : 0.5 )
        }
        .disabled(!viewModel.isAuthenticated || !isOn)
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
            .padding(.bottom,20)
            .foregroundColor(Color.theme.primaryTextColor)
    }
    
//    private var google : some View {
//        Image("Google")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 327, height: 56)
//            .padding(.bottom, 10)
//    }
    
    private var backButton : some View {
        Button(action: {
            backButtonTag = true
        }) {
            HStack() {
                Image("back-button-icon")
                    .resizable()
                    .foregroundColor(Color.theme.primaryTextColor)
                    .frame(width: 20,height: 32)
                    .padding([.top, .leading], 20)
                
                Spacer()
            }
            
        }
    }
}
