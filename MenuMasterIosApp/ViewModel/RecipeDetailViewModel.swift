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
    @Published var selectedMeal: String = "Kahvaltı"

    @Published var selectedBreakfastIngredients: [String] = []
    @Published var selectedLunchIngredients: [String] = []
    @Published var selectedSnackIngredients: [String] = []
    @Published var selectedDinnerIngredients: [String] = []
    
    private var isCreateButtonTapped: Bool
    
    init(isCreateButtonTapped: Bool) {
        self.isCreateButtonTapped = isCreateButtonTapped
        self.loadSavedRecipes()
        if isCreateButtonTapped {
            self.getRecipes()
            self.saveRecipes()
        }
    }
    
    private var isRecipesCreated: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isRecipesCreated")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isRecipesCreated")
        }
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
                    self.saveRecipes()
                }
            case .failure(let error):
                print("Hata: \(error.localizedDescription)")
                
            }
        }
    }
    
    func saveRecipes() {
        if let encoded = try? JSONEncoder().encode(recipes) {
            UserDefaults.standard.set(encoded, forKey: "savedRecipes")
            print("saved recipes :",encoded)
        }
    }
    
    func loadSavedRecipes() {
        if let savedRecipes = UserDefaults.standard.data(forKey: "savedRecipes"),
           let decodedRecipes = try? JSONDecoder().decode([RecipeResponseModel].self, from: savedRecipes) {
            self.recipes = decodedRecipes
            print("yukle recipes :",recipes)
        }
    }
    
    func clearRecipes() {
        self.recipes.removeAll()
        UserDefaults.standard.removeObject(forKey: "savedRecipes")
    }
    
    var selectedIngredients: [String] {
        switch selectedMeal {
        case "Kahvaltı":
            return selectedBreakfastIngredients
        case "Öğle Yemeği":
            return selectedLunchIngredients
        case "Ara Öğün":
            return selectedSnackIngredients
        case "Akşam Yemeği":
            return selectedDinnerIngredients
        default:
            return []
        }
    }
    
    func toggleSelection(for item: String) {
        switch selectedMeal {
        case "Kahvaltı":
            if selectedBreakfastIngredients.contains(item) {
                selectedBreakfastIngredients.removeAll { $0 == item }
            } else {
                selectedBreakfastIngredients.append(item)
            }
        case "Öğle Yemeği":
            if selectedLunchIngredients.contains(item) {
                selectedLunchIngredients.removeAll { $0 == item }
            } else {
                selectedLunchIngredients.append(item)
            }
        case "Ara Öğün":
            if selectedSnackIngredients.contains(item) {
                selectedSnackIngredients.removeAll { $0 == item }
            } else {
                selectedSnackIngredients.append(item)
            }
        case "Akşam Yemeği":
            if selectedDinnerIngredients.contains(item) {
                selectedDinnerIngredients.removeAll { $0 == item }
            } else {
                selectedDinnerIngredients.append(item)
            }
        default:
            break
        }
    }
    
    func saveSelectedIngredients(for mealType: String, ingredients: [String]) {
        switch mealType {
        case "Kahvaltı":
            UserDefaultsHelper.shared.setData(value: ingredients, key: .selectedBreakfastIngredients)
        case "Öğle Yemeği":
            UserDefaultsHelper.shared.setData(value: ingredients, key: .selectedLunchIngredients)
        case "Ara Öğün":
            UserDefaultsHelper.shared.setData(value: ingredients, key: .selectedSnackIngredients)
        case "Akşam Yemeği":
            UserDefaultsHelper.shared.setData(value: ingredients, key: .selectedDinnerIngredients)
        default:
            break
        }
    }
    
    func regenerateRecipes() {
        clearRecipes()
        getRecipes()
    }
    
    
}

