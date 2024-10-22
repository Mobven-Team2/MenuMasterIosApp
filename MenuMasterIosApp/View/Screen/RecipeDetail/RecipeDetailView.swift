//
//  RecipeDetailView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/4/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel : RecipeDetailViewModel
    @State private var shoppingList: [String] = []
    @State private var selectedSegment: Int = 0
    @State private var isButtonTapped: Bool = false
    @State private var isItemSelectButtonTapped = false
    @State var recipes : [RecipeResponseModel]
    @State var isCreateButtonTapped : Bool
    
    init(recipes: [RecipeResponseModel], isCreateButtonTapped: Bool) {
        self.recipes = recipes
        self.isCreateButtonTapped = isCreateButtonTapped
        self.viewModel = RecipeDetailViewModel(isCreateButtonTapped: isCreateButtonTapped)
    }
    
    var body: some View {
        NavigationViewStack {
            VStack {
                HStack {
                    backButton
                    Spacer()
                }
                HStack {
                    Text(viewModel.selectedMeal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .font(.poppins(size: 16))
                        .foregroundColor(Color.theme.primaryTextColor)
                    
                    Menu {
                        ForEach(recipes.map { $0.mealTypeName }, id: \.self) { option in
                            Button(action: {
                                viewModel.selectedMeal = option
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
                
                
                ForEach(recipes.filter { $0.mealTypeName == viewModel.selectedMeal }, id: \.id) { recipe in
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
                        .fontWeight(.semibold)
                        .font(.poppins(size: 16))
                    
                    Spacer()
                    
                    
                    if selectedSegment == 0 {
                        VStack {
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .center) {
                                    Text("\(recipe.mealTypeName) öğününüz için gereken ürünleri alışveriş listenize ekleyin.")
                                        .font(.poppins(size: 16))
                                        .padding(15)
                                    
                                    
                                    ForEach(recipe.ingredients, id: \.self) { item in
                                        IngredientsItemView(name: item, isSelected: viewModel.selectedIngredients.contains(item)) {
                                            viewModel.toggleSelection(for: item)
                                        }
                                    }
                                    
                                    Spacer()
                                    CustomButtonView(text: "Alışveriş Listene Ekle", isButtonTapped: $isButtonTapped) {
                                        viewModel.saveSelectedIngredients(for: viewModel.selectedMeal, ingredients: viewModel.selectedIngredients)
                                    }
                                    
                                }.frame(minHeight: UIScreen.main.bounds.height - 400)
                                
                            }
                        }.foregroundColor(Color.theme.customDarkTextColor)
                    } else {
                        VStack(alignment: .center) {
                            
                            HStack {
                                HStack {
                                    Text("1 Kişilik")
                                        .font(.poppins(size: 14))
                                        .fontWeight(.semibold)
                                    
                                    
                                    Image("clock-icon")
                                }.frame(width: (UIScreen.main.bounds.width - 48) / 2,height: 48)
                                    .background(Color.theme.lightOrangeColor)
                                    .cornerRadius(8.0)
                                    .foregroundColor(Color.theme.primaryOrangeColor)
                                
                                HStack {
                                    Text("30 Dakika")
                                        .font(.poppins(size: 14))
                                        .fontWeight(.semibold)
                                    
                                    
                                    Image("knife-icon")
                                }.frame(width: (UIScreen.main.bounds.width - 48) / 2,height: 48)
                                    .background(Color.theme.lightOrangeColor)
                                    .cornerRadius(8.0)
                                    .foregroundColor(Color.theme.primaryOrangeColor)
                            }.padding(.vertical,10)
                            
                            RecipeView(recipeText: recipe.recipe).padding(.horizontal,20)
                            
                            suggestionView
                            Spacer()
                        }
                        
                    }
                    
                }
                
            }
            .navigationDestinationWrapper(isPresented: $viewModel.backButtonTag, destination: {
                MainView()
            })
            .toolbar(.hidden)
            .onReceive(viewModel.$recipes) { updatedRecipes in
                self.recipes = updatedRecipes
            }
            .onAppear {
                if recipes.isEmpty {
                    viewModel.updateRecipes()
                    viewModel.loadSavedRecipes()
                }
                recipes = viewModel.recipes
            }
        }
    }
    
}

extension RecipeDetailView {
    private var backButton : some View {
        Button(action: {
            viewModel.backButtonTag = true
        }) {
            Image("back-button-icon")
                .resizable()
                .foregroundColor(Color.theme.primaryTextColor)
                .frame(width: 20,height: 32)
                .padding(.leading,20)
                .padding(.top,40)
        }
    }
    
    private var suggestionView : some View {
        HStack {
            Image("suggestion-first")
                .frame(width: 100, height: 100, alignment: .leading)
            
            VStack(alignment:.leading) {
                Text("Püf Noktalar")
                    .offset(x:-32)
                    .font(.poppins(size: 14))
                    .bold()
                
                
                Text("Yemeğinizi pişirirken süreyi dikkatlice takip etmeyi unutmayın")
                    .frame(width: 240, alignment: .leading)
                    .font(.poppins(size: 14))
                    .fontWeight(.regular)
                    .padding(.leading, -32)
                    .padding(.trailing, 28)
                .lineLimit(3)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 80)
        .background(Color.theme.suggestionRedColor)
        .cornerRadius(16)
        .padding(.top, 12)
    }
}




#Preview {
    RecipeDetailView(
        recipes: [
            RecipeResponseModel(id: 7, name: "Somon ve Avokado Kahvaltı Tabağı", ingredients:["Somon balığı", "Avokado", "Domates", "Salatalık", "Zeytinyağı", "Limon", "Tuz", "Karabiber"], recipe: "Somon balığını ızgarada pişirin. Avokadoyu dilimleyin. Domatesi ve salatalığı doğrayın. Bir tabağa somon balığını, dilimlenmiş avokadoyu, domatesi ve salatalığı yerleştirin. Üzerine zeytinyağı, limon suyu, tuz ve karabiber serpip servis yapın.", mealType: "Breakfast", isLiked: false),
            RecipeResponseModel(id: 8, name: "Somon ve Avokado Akşam Yemeği Tabağı", ingredients:["Somon balığı", "Avokado", "Domates", "Salatalık", "Zeytinyağı", "Limon", "Tuz", "Karabiber"], recipe: "Somon balığını ızgarada pişirin. Avokadoyu dilimleyin. Domatesi ve salatalığı doğrayın. Bir tabağa somon balığını, dilimlenmiş avokadoyu, domatesi ve salatalığı yerleştirin. Üzerine zeytinyağı, limon suyu, tuz ve karabiber serpip servis yapın.", mealType: "Dinner", isLiked: false),
            RecipeResponseModel(id: 9, name: "Tavuklu Sezar Salata", ingredients:["Tavuk göğsü", "Roka", "Marul", "Parmesan peyniri", "Kruton", "Sezar sosu"], recipe: "Tavuk göğsünü ızgarada pişirin ve doğrayın. Bir kaseye roka ve marulu ekleyin. Üzerine tavuk, kruton ve parmesan peynirini ekleyin. Sezar sosunu gezdirerek servis yapın.", mealType: "Lunch", isLiked: false),
            RecipeResponseModel(id: 10, name: "Elma ve Fıstık Ezmesi Atıştırmalık", ingredients:["Elma", "Fıstık ezmesi"], recipe: "Elmayı dilimleyin ve üzerine fıstık ezmesi sürerek atıştırmalık olarak servis yapın.", mealType: "Snack", isLiked: false)
        ], isCreateButtonTapped: false
    )
}
