//
//  MealCategoriesResponse.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/6/24.
//

import Foundation

struct MealCategoriesResponse: Codable {
    let categories: [MealCategoriesItemResponse]
    
    struct MealCategoriesItemResponse: Codable {
        let idCategory: String
        let strCategory: String
        let strCategoryThumb: String
    }
}
