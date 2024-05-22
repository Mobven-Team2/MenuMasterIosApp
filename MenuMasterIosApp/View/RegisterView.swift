//
//  RegisterView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/22/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        ZStack {
            Image("background-image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            VStack(alignment:.center) {
                Text("Kaydol")
                    .foregroundColor(Color.theme.titleColor)
                    .font(.chillaxVariable(size: 32))
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    
                    Text("İsim Soyisim")
                        .font(.dmSans(size: 14))
                        .foregroundColor(Color.theme.titleColor)
                    
                    TextField("Jane Doe", text: $fullName)
                        .font(.dmSans(size: 14))
                        .padding()
                        .frame(width: 327, height: 49)
                        .background(Color.white)
                        .cornerRadius(25.0)
                        .shadow(color: Color.black.opacity(0.1), radius: 45, x: 0, y: 2)
                    
                    
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
                    
                    Text("Şifre Tekrar")
                        .font(.dmSans(size: 14))
                        .foregroundColor(Color.theme.titleColor)
                    
                    ZStack(alignment:.trailing) {
                        if showPassword {
                            TextField("Şifre Tekrar", text: $password)
                            
                                .font(.dmSans(size: 14))
                                .padding()
                                .frame(width: 327, height: 49)
                                .background(Color.white)
                                .cornerRadius(25.0)
                                .shadow(color: Color.black.opacity(0.1), radius: 45, x: 0, y: 2)
                        } else {
                            SecureField("Şifre Tekrar", text: $confirmPassword)
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
                    .padding(.bottom,88)
                
                
                
                Button(action: {
                    // sign in
                }) {
                    Text("Hesap Oluştur")
                        .font(.dmSans(size: 16))
                        .foregroundColor(.white)
                        .frame(width: 327, height: 49)
                        .background(Color.theme.greenColor)
                        .cornerRadius(25.0)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 13)
                
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
    }
}

#Preview {
    RegisterView()
}


