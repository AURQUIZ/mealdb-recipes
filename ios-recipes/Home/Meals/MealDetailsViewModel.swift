//
//  MealDetailsViewModel.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/6/24.
//

import Foundation

class MealDetailsViewModel: ObservableObject {
    @Published var meal: MealDetails?
    
    func getMeasuredIngredients() -> [String] {
        guard let mealDetails = meal else {
            return []
        }
        
        var measuredIngredients: [String] = []
        
        for (i, item) in mealDetails.ingredients.enumerated() {
            if !(mealDetails.ingredients[i].trimmingCharacters(in: .whitespaces) == "") {
                measuredIngredients.append("\(mealDetails.measurements[i]) \(item)")
            }
        }
        
        return measuredIngredients
    }
}
