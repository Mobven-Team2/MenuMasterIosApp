//
//  CuisineSelectionViewModel.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/30/24.
//

import Foundation

class CuisineSelectionViewModel: ObservableObject {
    @Published var selectedCuisines: [Cuisine] = []
    
    @Published var allCuisines: [Cuisine] = Cuisine.allCases.map { $0 }
    
    func toggleCuisineSelection(_ cuisine: Cuisine) {
            if let index = selectedCuisines.firstIndex(of: cuisine) {
                selectedCuisines.remove(at: index)
            } else {
                selectedCuisines.append(cuisine)
            }
        }
}

