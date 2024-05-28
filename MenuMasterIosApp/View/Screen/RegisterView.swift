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
    
    //Validation messages
    @State private var test1: String = ""
    @State private var test2: String = ""
    @State private var test3: String = ""
    @State private var test4: String = ""
    
    var body: some View {
        NavigationViewStack {
            ZStack {
                VStack(alignment:.center) {
                    titleText
                    
                    VStack(alignment: .leading) {
                        
                        TextfieldView(title: "İsim Soyisim", placeholder: "", isPasswordField: false, errorMessage: test1, text: $viewModel.fullName)
                            .onChange(of: viewModel.fullName) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                test1 = viewModel.registerValidator?.errorMessage ?? ""
//                                if viewModel.isAuthenticated {
//                                    test1 = viewModel.registerValidator?.errorMessage ?? ""
//                                    test2 = viewModel.registerValidator?.errorMessage ?? ""
//                                    test3 = viewModel.registerValidator?.errorMessage ?? ""
//                                    test4 = viewModel.registerValidator?.errorMessage ?? ""
//                                }
                            }
                        
                        TextfieldView(title: "E-posta", placeholder: "", isPasswordField: false, errorMessage: test2, text: $viewModel.email)
                            .onChange(of: viewModel.email) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                test2 = viewModel.registerValidator?.errorMessage ?? ""
                            }
                        
                        ZStack(alignment:.trailing) {
                            TextfieldView(title: "Şifre", placeholder: "", isPasswordField: !showPassword, errorMessage: test3, text: $viewModel.password)
                                .onChange(of: viewModel.password) {
                                    viewModel.isAuthenticated = viewModel.validateFields()
                                    test3 = viewModel.registerValidator?.errorMessage ?? ""
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

                            TextfieldView(title: "Şifre Tekrar", placeholder: "", isPasswordField: !showPassword, errorMessage: test4, text: $viewModel.confirmPassword)
                                .onChange(of: viewModel.confirmPassword) {
                                    viewModel.isAuthenticated = viewModel.validateFields()
                                    test4 = viewModel.registerValidator?.errorMessage ?? ""
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
                        
                    }.padding(.top,34)
                        .padding(.bottom,88)
                    
                    Spacer()
                    
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
            registerTag = viewModel.register()
        }) {
            Text("Hesap Oluştur")
                .customButtonStyle()
                .opacity(viewModel.isAuthenticated ? 1 : 0.5)
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
            .padding(.bottom,20)
            .foregroundColor(Color.theme.primaryTextColor)
    }
}
