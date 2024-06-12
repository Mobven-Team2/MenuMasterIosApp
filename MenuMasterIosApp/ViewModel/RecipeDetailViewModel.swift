//
//  RecipeDetailViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/11/24.
//

import Foundation

class RecipeDetailViewModel : ObservableObject {
    
    @Published var userId: String = ""
    @Published var mealTypes: [String] = []
    @Published var recipes : [RecipeResponseModel] = []
    
    init() {
        getRecipes()
    }
    
    func getRecipes(){
        guard let id = UserDefaultsHelper.shared.getData(type: Int.self, forKey: .userId),
              let mealTypes = UserDefaultsHelper.shared.getData(type: [String].self, forKey: .selectedMeals) else {
            print("Kayıt için gerekli bilgiler eksik!")
            return
        }
        
        let requestModel = RecipesRequestModel(id: id, mealTypes: mealTypes)
        
        RecipesService().postSelectedMealRecipes(requestModel: requestModel) { result in
            switch result {
            case .success(let fetchedRecipes):
                DispatchQueue.main.async {
                    print("Fetched Recipes: \(fetchedRecipes)")
                    self.recipes = fetchedRecipes
                }
//                UserDefaultsHelper.shared.setData(value: self.recipes, key: .recipes)
            case .failure(let error):
                print("Hata: \(error.localizedDescription)")
                
            }
        }
    }
}
