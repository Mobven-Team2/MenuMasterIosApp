//
//  HomeSuggestionView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 6.06.2024.
//

import SwiftUI

struct HomeSuggestionView: View {
    var imageName: String
    var title: String
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(imageName)
                .frame(width: 80, height: 80)
                .padding(.leading, 20)
                .padding(.trailing, 10)
            
//            Spacer()
            
            VStack(alignment: .listRowSeparatorLeading) {
                Text(title)
                    .frame(width: 200, height: 21)
                    .font(.poppins(size: 14))
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(text)
                    .frame(width: 200, height: 63)
                    .font(.poppins(size: 14))
                    .fontWeight(.regular)
                    .lineLimit(3)
                    .padding(.bottom, 18)
                    .padding(.top, -10)
            }

//            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(.leading, 10)
                .padding(.trailing, 32)
                .padding(.bottom, 24)
            
            Spacer()
        }
    }
}

#Preview {
    HomeSuggestionView(
        imageName: "suggestion-photo",
        title: "Fotoğraftan yemek tarifi al",
        text: "Yemek fotoğraflarını analiz ederek, benzer tarifler sunar."
    )
}
