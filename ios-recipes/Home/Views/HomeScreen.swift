//
//  HomeScreen.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/6/24.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    @State private var categories: [MealCategory] = []
    @State private var didLoadOnce = false
    
    var body: some View {
        HomeView(categories: categories)
            .onAppear(perform: {
                if didLoadOnce {
                    return
                }
                
                Task {
                    do {
                        categories = try await MealsAPI().getCategories() ?? []
                    } catch let error {
                        print(error)
                    }
                }
            })
    }
}
