//
//  MealListScreen.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/5/24.
//

import Foundation
import SwiftUI

struct MealListScreen: View {
    let category: String
    
    @State private var mealList: [MealItem] = []
    @State private var didLoadOnce = false
    
    var body: some View {
        MealListView(mealList: mealList, category: category)
            .onAppear(perform: {
                if didLoadOnce {
                    return
                }
                
                Task {
                    do {
                        mealList = try await MealsAPI().getMeals(category: category) ?? []
                    } catch (let error){
                        print(error)
                    }
                }
            })
    }
}
