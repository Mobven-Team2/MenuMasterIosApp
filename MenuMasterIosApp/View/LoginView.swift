//
//  LoginView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/22/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    
    var body: some View {
        ZStack {
            Image("background-image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            

            VStack(alignment:.center) {
                Text("Giriş Yap")
                    .foregroundColor(Color.theme.titleColor)
                    .font(.chillaxVariable(size: 32))
                    .fontWeight(.semibold)
                
                
                VStack(alignment: .leading) {
                    Text("E-posta")
                        .font(.dmSans(size: 14))
                        .foregroundColor(Color.theme.titleColor)
                    
                    TextField("@janedoe.xamplemail.com", text: $email)
                        .font(.dmSans(size: 14))
                        .padding()
                        .frame(width: 327, height: 49)
                        .background(Color.white)
                        .cornerRadius(25.0)
                        .shadow(color: Color.black.opacity(0.1), radius: 45, x: 0, y: 2)
                    
                    Text("Şifre")
                        .font(.dmSans(size: 14))
                        .foregroundColor(Color.theme.titleColor)
                    
                    ZStack(alignment:.trailing) {
                        if showPassword {
                            TextField("Şifre", text: $password)
                            
                                .font(.dmSans(size: 14))
                                .padding()
                                .frame(width: 327, height: 49)
                                .background(Color.white)
                                .cornerRadius(25.0)
                                .shadow(color: Color.black.opacity(0.1), radius: 45, x: 0, y: 2)
                        } else {
                            SecureField("Şifre", text: $password)
                                .font(.dmSans(size: 14))
                                .padding()
                                .frame(width: 327, height: 49)
                                .background(Color.white)
                                .cornerRadius(25.0)
                                .shadow(color: Color.black.opacity(0.1), radius: 45, x: 0, y: 2)
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
                
                
                Button(action: {
                    // login
                    LoginViewModel().login()
                }) {
                    Text("Giriş Yap")
                        .font(.dmSans(size: 16))
                        .foregroundColor(.white)
                        .frame(width: 327, height: 49)
                        .background(Color.theme.greenColor)
                        .cornerRadius(25.0)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 13)
                
                HStack(spacing:3) {
                    Text("Hesabın yok mu?")
                    Button(action: {
                        // redirect register page
                    }) {
                        Text("Kaydol")
                            .underline()
                            .fontWeight(.bold)
                    }
                }.font(.dmSans(size: 16))
                    .foregroundColor(Color.theme.titleColor)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
