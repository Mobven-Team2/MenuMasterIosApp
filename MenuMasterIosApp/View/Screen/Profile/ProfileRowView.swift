//
//  ProfileRowView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 13.06.2024.
//

import SwiftUI

struct ProfileRowView: View {
    var firstImageName: String
    var secondImageName: String
    var firstText: String
    var secondText: String

    
    var body: some View {
        VStack {
            HStack {
                //            Spacer()
                
                Image(firstImageName)
                    .padding(.leading, 27)
                    .padding(.trailing, 8)
                
                Text(firstText)
                    .foregroundStyle(Color.theme.primaryTextColor)
                    .font(.poppins(size: 16))
                    .fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.leading, 10)
                    .padding(.trailing, 32)
                
                //            Spacer()
            }
            HStack {
                //            Spacer()
                
                Image(secondImageName)
                    .padding(.leading, 27)
                    .padding(.trailing, 8)
                
                Text(secondText)
                    .foregroundStyle(Color.theme.primaryTextColor)
                    .font(.poppins(size: 16))
                    .fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.leading, 10)
                    .padding(.trailing, 32)
                
                //            Spacer()
            }
        }
        .frame(width: 347, height: 130)
        .background(Color.theme.profileRowBgColor)
        .cornerRadius(16)
    }
}

#Preview {
    ProfileRowView(firstImageName: "profile-icon-user", secondImageName: "profile-icon-history", firstText: "Kişisel Bilgiler", secondText: "Beslenme Geçmişi")
}
