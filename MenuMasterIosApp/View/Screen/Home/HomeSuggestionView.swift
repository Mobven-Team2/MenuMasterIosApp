//
//  HomeSuggestionView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 6.06.2024.
//

import SwiftUI

struct HomeSuggestionView: View {
    var imageName: String
    var text: String
    var backgroundColor: Color
    
    var body: some View {
        HStack {
            Image(imageName)
                .frame(width: 100, height: 100, alignment: .leading)
            
            Text(text)
                .frame(width: 240, alignment: .leading)
                .font(.poppins(size: 14))
                .fontWeight(.regular)
                .padding(.leading, -32)
                .padding(.trailing, 28)
                .lineLimit(3)
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 80)
        .background(backgroundColor)
        .cornerRadius(16)
        .padding(.bottom, 8)
    }
}

#Preview {
    VStack {
        HomeSuggestionView(imageName: "suggestion-first", text: "Yemeğinizi pişirirken süreyi dikkatlice takip etmeyi unutmayın", backgroundColor: Color.theme.suggestionRedColor)
        
        HomeSuggestionView(imageName: "suggestion-second", text: "Yemeğinizi pişirirken süreyi dikkatlice takip etmeyi unutmayın", backgroundColor: Color.theme.suggestionGreenColor)
        
    }
}
