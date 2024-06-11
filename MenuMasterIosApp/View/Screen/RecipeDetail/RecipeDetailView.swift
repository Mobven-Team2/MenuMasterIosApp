//
//  RecipeDetailView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel = RecipeDetailViewModel()
    @State private var selectedMeal: MealType = .breakfast
    @State private var showIngredients = false
    @State private var shoppingList: [String] = []
    @State private var selectedSegment: Int = 0
    @State private var isButtonTapped: Bool = false
    
    let ingredients = [
        MealType.breakfast: ["2 adet yumurta", "1 su bardağı süt", "1 tatlı kaşığı yoğurt", "250 gr şeker", "1 tatlı kaşığı bal"],
        MealType.snack: ["1 avuç fındık", "1 adet elma", "1 su bardağı yoğurt"],
        MealType.lunch: ["150 gr tavuk göğsü", "1 tabak bulgur pilavı", "1 kase yoğurt"],
        MealType.dinner: ["1 kase mercimek çorbası", "200 gr ızgara balık", "1 porsiyon salata"]
    ]
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text(selectedMeal.rawValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.poppins(size: 16))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Menu {
                    ForEach(MealType.allCases, id: \.self) { option in
                        Button(action: {
                            selectedMeal = option
                        }) {
                            Text(option.rawValue)
                        }
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .foregroundColor(Color.theme.primaryTextColor)
                        .frame(width: 12, height: 8)
                }
                .padding(.trailing, 16)
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 48, minHeight: 47)
            .background(.white)
            .cornerRadius(8)
            .shadow(color: Color.gray.opacity(0.1), radius: 8, x: 3, y: 10)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            
            Spacer()
            VStack(alignment: .leading){
                HStack{
                    Text("Çilekli Pankek")
                        .font(.poppins(size: 22))
                        .bold()
                    Spacer()
                }
                Text("Vegan Tarif")
                    .font(.poppins(size: 16))
            }.padding(.leading,20)
            
            Spacer()
            
            CustomSegmentedControl(preselectedIndex: $selectedSegment, options: ["İçindekiler","Tarif"])
                .padding(.horizontal,20)
            
            
            
            
            Spacer()
            
            if selectedSegment == 0 {
                VStack(alignment: .center) {
                    Text("Kahvaltı öğününüz için gereken ürünleri alışveriş listenize ekleyin.")
                        .font(.poppins(size: 16))
                    Spacer()
                    
                    ForEach(ingredients[selectedMeal] ?? [], id: \.self) { item in
                        Text(item)
                    }
                    
                    CustomButtonView(text: "Alışveriş Listene Ekle", isButtonTapped: $isButtonTapped) {
                        // alısveris listesine eklenecek
                    }
                }
                .frame(height: 500)
            } else {
                VStack(alignment: .leading) {
                    Text("Tarif Detay")
                    // Burada tarif detaylarını ekleyebilirsiniz.
                    Text("Tarif detayları burada yer alacak...")
                }
                .frame(height: 500)
            }
        }.onAppear {
            viewModel.getRecipes()
        }
      
        
    }
    
    private func addIngredientsToShoppingList() {
        if let selectedIngredients = ingredients[selectedMeal] {
            shoppingList.append(contentsOf: selectedIngredients)
            print("Alışveriş listesi güncellendi: \(shoppingList)")
        }
    }
    
}

#Preview {
    RecipeDetailView()
}
