//
//  MealsListAPI.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/4/24.
//

import Foundation

struct MealListResponse: Codable {
    let meals: [MealItemAPI]
    
    struct MealItemAPI: Codable {
        let strMeal: String
        let strMealThumb: String
        let idMeal: String
    }
}
