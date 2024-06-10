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
                        
            VStack {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.poppins(size: 14))
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.poppins(size: 14))
                    .fontWeight(.regular)
                    .lineLimit(3)
            }
            
            Image(systemName: "chevron.right")
                .padding(.leading, 10)
                .padding(.trailing, 32)
            
            Spacer()
        }
    }
}

#Preview {
    VStack {
        HomeSuggestionView(imageName: "suggestion-photo", title: "Fotoğraftan Yemek Tarifi Al", text: "Yemek fotoğraflarını analiz ederek, benzer tarifler sunar.")
        
        HomeSuggestionView(imageName: "suggestion-list", title: "Alışveriş Listesi ve Sepet", text: "Tariflerinizdeki malzemeleri listeler, sizi market alışverişine yönlendirir.")
        
        HomeSuggestionView(imageName: "suggestion-fridge", title: "Buzdolabından Alternatifler", text: "Malzemelerinizin analizini yaparak tariflerinizi ve öğünlerinizi oluşturur.")
    }
}
