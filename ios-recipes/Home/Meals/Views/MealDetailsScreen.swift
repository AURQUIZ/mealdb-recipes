//
//  MealDetailsScreen.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/6/24.
//

import Foundation
import SwiftUI

struct MealDetailsScreen: View {
    let mealId: String
    
    @StateObject private var mealDetailsVM: MealDetailsViewModel = MealDetailsViewModel()
    @State private var didLoadOnce = false
    
    var body: some View {
        MealDetailsView(title: mealDetailsVM.meal?.mealTitle ?? "",
                        instructions: mealDetailsVM.meal?.instructions ?? "",
                        ingredients: mealDetailsVM.getMeasuredIngredients(),
                        imageUrl: mealDetailsVM.meal?.imageUrl ?? "")
            .onAppear(perform: {
                if didLoadOnce {
                    return
                }
                
                Task {
                    do {
                        mealDetailsVM.meal = try await MealsAPI().getMealDetails(id: mealId)
                    } catch let error {
                        print(error)
                    }
                }
            })
    }
}
