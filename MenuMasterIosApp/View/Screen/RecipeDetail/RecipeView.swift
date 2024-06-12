//
//  RecipeView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/12/24.
//

import SwiftUI
struct RecipeView : View {
    var recipeText: String
    
    @State private var currentStepIndex = 0
    
    var steps: [String] {
         if recipeText.starts(with: "1.") {
             var cleanedText = recipeText
             for number in 1...9 {
                cleanedText = cleanedText.replacingOccurrences(of: "\(number).", with: "")
            }
             return cleanedText.components(separatedBy: ". ")
         } else {
             return recipeText.components(separatedBy: ".")
         }
     }
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("\(currentStepIndex + 1). Adım")
                .font(.poppins(size: 18))
                .fontWeight(.semibold)
                .padding(.leading,22)
                .padding(.top, 22)
            HStack() {
                Text("\(steps[currentStepIndex]).")
                    .font(.poppins(size: 16))
                    .fontWeight(.regular)
                    .padding(.leading,22)
                
            }
            .foregroundColor(Color.theme.customDarkTextColor)
             
            .frame(width: UIScreen.main.bounds.width - 48 , height: 135)
            
            HStack{
                if currentStepIndex > 0 {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 16,height: 10)
                        .padding(0)
                    
                    Button(action: {
                        currentStepIndex -= 1
                    }) {
                        Text("Önceki Adım")
                            .font(.poppins(size: 16))
                    }
                }
                Spacer()
                if currentStepIndex < steps.count - 2 {
                    Button(action: {
                        currentStepIndex += 1
                    }) {
                        Text("Sonraki Adım")
                            .font(.poppins(size: 16))
                    }
                    Image(systemName: "arrow.forward")
                        .resizable()
                        .frame(width: 16,height: 10)
                        .padding(0)
                }
            }
            .foregroundColor(Color.theme.primaryOrangeColor)
            .padding(.horizontal, 20)
            .padding(.bottom,12)
        }
        .background(.white)
        .cornerRadius(16)
        .shadow(color: Color.gray.opacity(0.1), radius: 8, x: 0, y: 0)
    }
}

#Preview {
    RecipeView(recipeText: "Yulaf ezmesini fırın tepsisine yayın. Üzerine doğranmış fındık, tarçın ve bal ekleyin, iyice karıştırın. Önceden ısıtılmış 180 derece fırında 20-25 dakika pişirin. Piştikten sonra kurutulmuş meyveler ekleyerek servis yapın.")
}
