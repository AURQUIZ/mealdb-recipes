//
//  HomeView.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/6/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    let categories: [MealCategory]
    let gridItems = [GridItem(.flexible(), spacing: 8),GridItem(.flexible(), spacing: 8),GridItem(.flexible(), spacing: 8)]
    
    var body: some View {
        ScrollView {
            Text("Categories")
            LazyVGrid(columns: gridItems, content: {
                ForEach(categories, id: \.category) { category in
                    NavigationLink(value: MealsNavigation.MealList(category.category) ) {
                        CategoryItem(category: category)
                    }
                }
            })
            .padding([.leading, .trailing])
        }
    }
    
    func CategoryItem(category: MealCategory) -> some View {
        ZStack(alignment: Alignment.bottom) {
            AsyncImage(url: URL(string: category.imageUrl), scale: 1) { val in
                switch val {
                case .empty:
                    Text("loading...")
                case .failure(_):
                    Text("failed")
                case .success(let image):
                    image
                        .resizable()
                @unknown default:
                    fatalError()
                }
            }
            .scaledToFit()
            .frame(width: 100, height: 100)
            
            VStack {
                Text(category.category)
                    .foregroundStyle(.white)
                    .padding([.leading, .trailing])
            }
            .frame(maxWidth: .infinity)
            .background(Color.indigo)
            
        }
    }
}
struct Home_Preview: PreviewProvider {
    static var previews: some View {
        HomeView(categories: [
            MealCategory(category: "Beef", imageUrl: "https://www.themealdb.com/images/category/beef.png"),
            MealCategory(category: "Chicken", imageUrl: "https://www.themealdb.com/images/category/chicken.png"),
            MealCategory(category: "Dessert", imageUrl: "https://www.themealdb.com/images/category/dessert.png"),
            MealCategory(category: "Lamb", imageUrl: "https://www.themealdb.com/images/category/lamb.png")
        ])
    }
}
