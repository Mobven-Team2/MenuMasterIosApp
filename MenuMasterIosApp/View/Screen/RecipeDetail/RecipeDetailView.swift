//
//  RecipeDetailView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel = RecipeDetailViewModel()
    @State private var selectedMeal: String = ""
    @State private var showIngredients = false
    @State private var shoppingList: [String] = []
    @State private var selectedSegment: Int = 0
    @State private var isButtonTapped: Bool = false
    
    @State private var selectedIngredients: Set<String> = []
    @State private var isItemSelectButtonTapped = false
    @State var recipes : [RecipeResponseModel]
    
    
    var body: some View {
        VStack {
            
            HStack {
                Text(selectedMeal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.poppins(size: 16))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Menu {
                    ForEach(recipes.map { $0.mealTypeName }, id: \.self) { option in
                        Button(action: {
                            selectedMeal = option
                        }) {
                            Text(option)
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
            
            
            ForEach(recipes.filter { $0.mealTypeName == selectedMeal }, id: \.id) { recipe in
                VStack(alignment: .leading){
                    HStack{
                        Text(recipe.name)
                            .font(.poppins(size: 22))
                            .bold()
                            
                        Spacer()
                    }
                    
                    Text("Tarif")
                        .font(.poppins(size: 16))
                }.frame(width: UIScreen.main.bounds.width - 48,height: 90)
                    .foregroundColor(Color.theme.customDarkTextColor)
                
                
                Spacer()
                
                CustomSegmentedControl(preselectedIndex: $selectedSegment, options: ["İçindekiler","Tarif"])
                    .padding(.horizontal,20)
                
                Spacer()
                
                
                if selectedSegment == 0 {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .center) {
                                Text("\(recipe.mealTypeName) öğününüz için gereken ürünleri alışveriş listenize ekleyin.")
                                    .font(.poppins(size: 16))
                                    .padding(15)
                                Spacer()
                                
                                ForEach(recipe.ingredients, id: \.self) { item in
                                    IngredientsItemView(name: item, isSelected: selectedIngredients.contains(item)) {
                                        self.toggleSelection(for: item)
                                    }
                                }
                                
                                CustomButtonView(text: "Alışveriş Listene Ekle", isButtonTapped: $isButtonTapped) {
                                    // alısveris listesine eklenecek
                                }
                            }
                            
                        }
                    }.foregroundColor(Color.theme.customDarkTextColor)
                } else {
                    VStack(alignment: .leading) {
                        
                        RecipeView(recipeText: recipe.recipe)
                        Spacer()
                    }
                    
                    
                    
                }
         
            }
            
        }.onAppear {
            if recipes.isEmpty {
                viewModel.getRecipes()
                recipes = viewModel.recipes
                selectedMeal = recipes.first?.mealTypeName ?? "Kahvaltı"
            }
            selectedMeal = recipes.first?.mealTypeName ?? "Kahvaltı"
        }
    }
    
}


extension RecipeDetailView {
    private func toggleSelection(for item: String) {
        if selectedIngredients.contains(item) {
            selectedIngredients.remove(item)
        } else {
            selectedIngredients.insert(item)
        }
    }
}



#Preview {
    RecipeDetailView(
        recipes: [
            RecipeResponseModel(id: 7, name: "Somon ve Avokado Kahvaltı Tabağı", ingredients:["Somon balığı", "Avokado", "Domates", "Salatalık", "Zeytinyağı", "Limon", "Tuz", "Karabiber"], recipe: "Somon balığını ızgarada pişirin. Avokadoyu dilimleyin. Domatesi ve salatalığı doğrayın. Bir tabağa somon balığını, dilimlenmiş avokadoyu, domatesi ve salatalığı yerleştirin. Üzerine zeytinyağı, limon suyu, tuz ve karabiber serpip servis yapın.", mealType: "Breakfast", isLiked: false),
            RecipeResponseModel(id: 8, name: "Somon ve Avokado Akşam Yemeği Tabağı", ingredients:["Somon balığı", "Avokado", "Domates", "Salatalık", "Zeytinyağı", "Limon", "Tuz", "Karabiber"], recipe: "Somon balığını ızgarada pişirin. Avokadoyu dilimleyin. Domatesi ve salatalığı doğrayın. Bir tabağa somon balığını, dilimlenmiş avokadoyu, domatesi ve salatalığı yerleştirin. Üzerine zeytinyağı, limon suyu, tuz ve karabiber serpip servis yapın.", mealType: "Dinner", isLiked: false),
            RecipeResponseModel(id: 9, name: "Tavuklu Sezar Salata", ingredients:["Tavuk göğsü", "Roka", "Marul", "Parmesan peyniri", "Kruton", "Sezar sosu"], recipe: "Tavuk göğsünü ızgarada pişirin ve doğrayın. Bir kaseye roka ve marulu ekleyin. Üzerine tavuk, kruton ve parmesan peynirini ekleyin. Sezar sosunu gezdirerek servis yapın.", mealType: "Lunch", isLiked: false),
            RecipeResponseModel(id: 10, name: "Elma ve Fıstık Ezmesi Atıştırmalık", ingredients:["Elma", "Fıstık ezmesi"], recipe: "Elmayı dilimleyin ve üzerine fıstık ezmesi sürerek atıştırmalık olarak servis yapın.", mealType: "Snack", isLiked: false)
        ]
    )
}
