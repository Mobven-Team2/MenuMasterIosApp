//
//  ProfileInfoView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 13.06.2024.
//

import SwiftUI

struct ProfileInfoView: View {
    var data: String
    var text: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(data)
                .font(.poppins(size: 14))
                .foregroundStyle(Color.theme.primaryOrangeColor)
                .fontWeight(.semibold)
            Text(text)
                .font(.poppins(size: 12))
                .fontWeight(.semibold)
        }
        .frame(width: 99, height: 65)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)

    }
}

#Preview {
    ProfileInfoView(data: "160cm", text: "Boy")
}
