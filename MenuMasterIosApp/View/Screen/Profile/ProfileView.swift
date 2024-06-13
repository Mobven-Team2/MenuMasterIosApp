//
//  ProfileView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 11.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                Image("profile-avatar")
                    .padding(.top, 26)
                
                Text(viewModel.name)
                    .foregroundStyle(Color.theme.primaryTextColor)
                    .font(.poppins(size: 18))
                    .fontWeight(.bold)
                    .padding(8)
                
                HStack {
                    ProfileInfoView(data: String(viewModel.height), text: "Boy")
                    Spacer()
                    ProfileInfoView(data: String(viewModel.weight), text: "Kilo")
                    Spacer()
                    ProfileInfoView(data: String(viewModel.age), text: "Yaş")
                }
                .frame(width: UIScreen.main.bounds.width - 48, height: 70)
                .padding(.bottom, 16)
                
                ProfileRowView(firstImageName: "profile-icon-user", secondImageName: "profile-icon-history", firstText: "Kişisel Bilgiler", secondText: "Beslenme Geçmişi")
                
                HStack {
                    Image("profile-icon-popup")
                        .padding(.leading, 27)
                        .padding(.trailing, 8)
                    
                    Text("Pop-up Bildirimler")
                        .foregroundStyle(Color.theme.primaryTextColor)
                        .font(.poppins(size: 16))
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .padding(.leading, 10)
                        .padding(.trailing, 32)
                }
                .frame(width: 347, height: 80)
                .background(Color.theme.profileRowBgColor)
                .cornerRadius(16)
                .padding()
                
                ProfileRowView(firstImageName: "profile-icon-settings", secondImageName: "profile-icon-logout", firstText: "Ayarlar", secondText: "Çıkış Yap")
            }
        }
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    
}
