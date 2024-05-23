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
    
    var body: some View {
        ZStack {
            backgroundImage
            
            VStack(alignment:.center) {
                titleText
                
                VStack(alignment: .leading) {
                    
                    Text("İsim Soyisim")
                        .formTitleStyle()
                    
                    TextField("Jane Doe", text: $viewModel.fullName)
                        .customTextFieldStyle()
                    
                    Text("E-posta")
                        .formTitleStyle()
                    
                    TextField("@janedoe.xamplemail.com", text: $viewModel.email)
                        .customTextFieldStyle()
                    
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
                    
                    Text("Şifre Tekrar")
                        .formTitleStyle()
                    
                    ZStack(alignment:.trailing) {
                        if showPassword {
                            TextField("Şifre Tekrar", text: $viewModel.confirmPassword)
                                .customTextFieldStyle()
                        } else {
                            SecureField("Şifre Tekrar", text: $viewModel.confirmPassword)
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
                    .padding(.bottom,88)
                
                createAccountButton
                redirectLoginPageButton
             
            }
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
                // redirect register page
            }) {
                Text("Giriş Yap")
                    .underline()
                    .fontWeight(.bold)
            }
        }.font(.dmSans(size: 16))
            .foregroundColor(Color.theme.titleColor)
    }
    
}
