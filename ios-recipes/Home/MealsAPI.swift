//
//  MealsAPI.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/4/24.
//

import Foundation

class MealsAPI {
    let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
    
    func getCategories() async throws -> [MealCategory]? {
        guard let url = URL(string: "\(baseUrl)categories.php") else {
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let results = try JSONDecoder().decode(MealCategoriesResponse.self, from: data)
        
        var categories: [MealCategory] = results.categories.map({MealCategory(category: $0.strCategory,
                                                                              imageUrl: $0.strCategoryThumb)})
        
        return categories.sorted(by: {$0.category < $1.category})
    }
    
    func getMeals(category: String) async throws -> [MealItem]? {
        guard let url = URL(string: "\(baseUrl)filter.php?c=\(category)") else {
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let results = try JSONDecoder().decode(MealListResponse.self, from: data)
        
        var meals:[MealItem] = results.meals.map({MealItem(mealId: $0.idMeal,
                                                           mealTitle: $0.strMeal,
                                                           imageUrl: $0.strMealThumb)})
        
        return meals.sorted(by: {$0.mealTitle < $1.mealTitle})
    }
    
    func getMealDetails(id: String) async throws -> MealDetails? {
        
        guard let url = URL(string: "\(baseUrl)lookup.php?i=\(id)") else {
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let results = try JSONDecoder().decode(MealDetailsResponse.self, from: data)
        
        guard let mealDetail = results.meals.first else {
            return nil
        }
        
        var tempIngredients: [String] = []
        tempIngredients.append(mealDetail.strIngredient1 ?? "")
        tempIngredients.append(mealDetail.strIngredient2 ?? "")
        tempIngredients.append(mealDetail.strIngredient3 ?? "")
        tempIngredients.append(mealDetail.strIngredient4 ?? "")
        tempIngredients.append(mealDetail.strIngredient5 ?? "")
        tempIngredients.append(mealDetail.strIngredient6 ?? "")
        tempIngredients.append(mealDetail.strIngredient7 ?? "")
        tempIngredients.append(mealDetail.strIngredient8 ?? "")
        tempIngredients.append(mealDetail.strIngredient9 ?? "")
        tempIngredients.append(mealDetail.strIngredient10 ?? "")
        tempIngredients.append(mealDetail.strIngredient11 ?? "")
        tempIngredients.append(mealDetail.strIngredient12 ?? "")
        tempIngredients.append(mealDetail.strIngredient13 ?? "")
        tempIngredients.append(mealDetail.strIngredient14 ?? "")
        tempIngredients.append(mealDetail.strIngredient15 ?? "")
        tempIngredients.append(mealDetail.strIngredient16 ?? "")
        tempIngredients.append(mealDetail.strIngredient17 ?? "")
        tempIngredients.append(mealDetail.strIngredient18 ?? "")
        tempIngredients.append(mealDetail.strIngredient19 ?? "")
        tempIngredients.append(mealDetail.strIngredient20 ?? "")
        
        var tempMeasurements: [String] = []
        tempMeasurements.append(mealDetail.strMeasure1 ?? "")
        tempMeasurements.append(mealDetail.strMeasure2 ?? "")
        tempMeasurements.append(mealDetail.strMeasure3 ?? "")
        tempMeasurements.append(mealDetail.strMeasure4 ?? "")
        tempMeasurements.append(mealDetail.strMeasure5 ?? "")
        tempMeasurements.append(mealDetail.strMeasure6 ?? "")
        tempMeasurements.append(mealDetail.strMeasure7 ?? "")
        tempMeasurements.append(mealDetail.strMeasure8 ?? "")
        tempMeasurements.append(mealDetail.strMeasure9 ?? "")
        tempMeasurements.append(mealDetail.strMeasure10 ?? "")
        tempMeasurements.append(mealDetail.strMeasure11 ?? "")
        tempMeasurements.append(mealDetail.strMeasure12 ?? "")
        tempMeasurements.append(mealDetail.strMeasure13 ?? "")
        tempMeasurements.append(mealDetail.strMeasure14 ?? "")
        tempMeasurements.append(mealDetail.strMeasure15 ?? "")
        tempMeasurements.append(mealDetail.strMeasure16 ?? "")
        tempMeasurements.append(mealDetail.strMeasure17 ?? "")
        tempMeasurements.append(mealDetail.strMeasure18 ?? "")
        tempMeasurements.append(mealDetail.strMeasure19 ?? "")
        tempMeasurements.append(mealDetail.strMeasure20 ?? "")
        
        return MealDetails(id: mealDetail.idMeal,
                           mealTitle: mealDetail.strMeal,
                           foodCategory: mealDetail.strCategory,
                           foodOrigin: mealDetail.strArea,
                           instructions: mealDetail.strInstructions,
                           imageUrl: mealDetail.strMealThumb,
                           ingredients: tempIngredients,
                           measurements: tempMeasurements)
    }
}
