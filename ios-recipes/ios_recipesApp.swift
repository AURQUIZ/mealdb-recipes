//
//  ios_recipesApp.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/4/24.
//

import SwiftUI

enum MealsNavigation: Hashable {
    case MealList(String)
    case MealDetails(String)
}

@main
struct ios_recipesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeScreen()
                    .navigationDestination(for: MealsNavigation.self) { val in
                        switch (val) {
                        case .MealList(let category):
                            MealListScreen(category: category)
                        case .MealDetails(let mealId):
                            MealDetailsScreen(mealId: mealId)
                        }
                    }
            }
        }
    }
}
