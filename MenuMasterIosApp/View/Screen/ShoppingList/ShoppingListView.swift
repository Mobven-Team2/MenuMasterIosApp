//
//  ShoppingListView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/12/24.
//

import SwiftUI

struct ShoppingListView: View {
    @State private var selectedSegment: Int = 0
    @State private var breakfastShoppingList : [String] = (UserDefaultsHelper.shared.getData(type: [String].self, forKey: .selectedIngredients) ?? ["Yumurta","Kinoa","Fındık","Hindistan cevizi","Bal","Kinoa","Fındık","Hindistan cevizi","Bal","Kinoa","Fındık","Hindistan cevizi","Bal"])
    @State private var snackShoppingList : [String] = (UserDefaultsHelper.shared.getData(type: [String].self, forKey: .selectedIngredients) ?? ["Fıstık"])
    @State private var lunchShoppingList : [String] = (UserDefaultsHelper.shared.getData(type: [String].self, forKey: .selectedIngredients) ?? ["Bezelye"])
    @State private var dinnerShoppingList : [String] = (UserDefaultsHelper.shared.getData(type: [String].self, forKey: .selectedIngredients) ?? ["Tavuk"])
    
    var body: some View {
        VStack {
            ShoppingSegmentedControlView(preselectedIndex: $selectedSegment, options: ["Kahvaltı", "Ara Öğün", "Öğle", "Akşam"])
                .padding(.top,70)
            
            ScrollView(showsIndicators: false) {
                if selectedSegment == 0 {
                    ForEach(breakfastShoppingList, id: \.self) { item in
                        IngredientsItemView(
                            name: item,
                            isSelected: false,
                            action: {}
                        )
                    }
                } else if selectedSegment == 1 {
                    ForEach(snackShoppingList, id: \.self) { item in
                        IngredientsItemView(
                            name: item,
                            isSelected: false,
                            action: {}
                        )
                    }
                } else if selectedSegment == 2 {
                    ForEach(lunchShoppingList, id: \.self) { item in
                        IngredientsItemView(
                            name: item,
                            isSelected: false,
                            action: {}
                        )
                    }
                } else if selectedSegment == 3 {
                    ForEach(dinnerShoppingList, id: \.self) { item in
                        IngredientsItemView(
                            name: item,
                            isSelected: false,
                            action: {}
                        )
                    }
                }
            }.padding(.bottom,90)
            
            
        }.frame(minHeight: UIScreen.main.bounds.height)
            
            
           
    }
}

#Preview {
    ShoppingListView()
}
