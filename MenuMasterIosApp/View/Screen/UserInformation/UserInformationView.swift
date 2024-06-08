//
//  WelcomeView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/27/24.
//

import SwiftUI

struct UserInformationView: View {
    @StateObject var viewModel = UserInformationViewModel()
    @State private var isContinueButtonTapped = false
    @State private var loginTag: Bool = false
    @State private var continueTag: Bool = false
    @State private var backButtonTag: Bool = false
    
    //Validation error messages
    @State private var errorAge: String = ""
    @State private var errorHeight: String = ""
    @State private var errorWeight: String = ""
    
    var body: some View {
        NavigationViewStack {
            VStack(alignment: .center) {
                VStack(alignment: .leading,spacing: 8){
                    
                    backButton
                    
                    Text("Bilgilerini Gir")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.chillaxVariable(size: 24))
                        .fontWeight(.semibold)
                    
                    Text("Yemek tariflerini sana özel olarak hazırlayabilmemiz için aşağıdaki bilgileri doldurmalısın.")
                        .foregroundColor(Color.theme.primaryTextColor)
                        .font(.dmSans(size: 14))
                        .lineSpacing(8)
                        .lineLimit(2)
                    
                }.frame(width: UIScreen.main.bounds.width - 39)
                
                Spacer()
                
                Form {
                    VStack(spacing: 20) {
                        TextfieldView(title: "Yaş", placeholder: "", isPasswordField: false, errorMessage: errorAge, text: $viewModel.age)
                            .onChange(of: viewModel.age) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                errorAge = viewModel.validateAge()
                            }
                        
                        CustomPickerView(title: "Cinsiyet", selection: $viewModel.gender, options: Gender.allCases, placeholder: "")
                            .onChange(of: viewModel.gender) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                viewModel.objectWillChange.send()
                            }
                        
                        TextfieldView(title: "Boy", placeholder: "CM", isPasswordField: false, errorMessage: errorHeight, text: $viewModel.height)
                            .onChange(of: viewModel.height) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                errorHeight = viewModel.validateHeight()
                            }
                        
                        TextfieldView(title: "Kilo", placeholder: "KG", isPasswordField: false, errorMessage: errorWeight, text: $viewModel.weight)
                            .onChange(of: viewModel.weight) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                errorWeight = viewModel.validateWeight()
                            }
                        
                        CustomPickerView(title: "Aktivite Durumu", selection: $viewModel.activityStatus, options: ActivityStatus.allCases, placeholder: "")
                            .onChange(of: viewModel.activityStatus) {
                                viewModel.isAuthenticated = viewModel.validateFields()
                                viewModel.objectWillChange.send()
                            }
                    }
                    
                }.scrollContentBackground(.hidden)
                    .formStyle(.columns)
                    .frame(height: 450)
                    .padding(.bottom,30)
                
                
                CustomButtonView(text: "Devam Et", isButtonTapped: $isContinueButtonTapped) {
                    viewModel.saveUserInformation()
                    continueTag = true
                }.disabled(!viewModel.areUserDefaultsFilled() && !viewModel.isAuthenticated)
                    .opacity(viewModel.isAuthenticated || viewModel.areUserDefaultsFilled() ? 1 : 0.5)

                redirectLoginPageButton
                
            }.navigationDestinationWrapper(isPresented: $continueTag, destination: {
                DietTypeView()
            })
            .navigationDestinationWrapper(isPresented: $loginTag, destination: {
                LoginView()
            })
            .navigationDestinationWrapper(isPresented: $backButtonTag, destination: {
                WelcomeView()
            })
            
        }
    }
}

#Preview {
    UserInformationView()
}


extension UserInformationView {
    
    private var redirectLoginPageButton : some View {
        HStack(spacing:3) {
            Text("Hesabın var mı?")
            Button(action: {
                loginTag = true
            }) {
                Text("Giriş Yap")
                    .underline()
                    .fontWeight(.bold)
            }
        }.font(.dmSans(size: 16))
            .foregroundColor(Color.theme.primaryTextColor)
    }
    
    private var backButton : some View {
        Button(action: {
            backButtonTag = true
        }) {
            Image("back-button-icon")
                .resizable()
                .foregroundColor(Color.theme.primaryTextColor)
                .frame(width: 20,height: 32)
                .padding(0)
        }
    }
}
