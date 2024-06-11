//
//  RecipesService.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/11/24.
//

import Foundation

class RecipesService {
    
    // Post Request to take recipes
    
    func postSelectedMealRecipes(requestModel: RecipesRequestModel,completion: @escaping (Result<[RecipeResponseModel], ServiceError>) -> Void) {
        let request = UserAPI.postRecipes(id: requestModel.id, mealTypes: requestModel.mealTypes)
        print("req:",request)
        Networking.shared.request(request, type: RecipesResponseModel.self, decodingType: .useDefaultKeys) { result in
            print("recipes : ",result)
            switch result {
            case .success(let dataModel):
                // Handle Success Case
                print("Success")
                completion(.success(dataModel.recipes))
            case .failure(let error):
                if let err = error as? NetworkError {
                    switch err {
                    case .decodableFailure(let error):
                        // Handle Decodable Failure Case
                        print("Decodable Failure \(error)")
                        completion(.failure(.custom(errorMessage: "decoding error")))
                    default :
                        // Handle Other Failure Cases
                        print("Other Errors")
                        completion(.failure(.custom(errorMessage: "other error")))
                    }
                }
            }
        }
        
        
    }
    
}
