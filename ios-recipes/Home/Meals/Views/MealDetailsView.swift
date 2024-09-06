//
//  MealDetailsView.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/5/24.
//

import Foundation
import SwiftUI

struct MealDetailsView: View {
    let title: String
    let instructions: String
    let ingredients: [String]
    let imageUrl: String
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: imageUrl), scale: 1) { val in
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
            .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .padding([.bottom])
                Text("Ingredients:")
                    .font(.headline)
                ForEach(ingredients, id: \.self) { val in
                    Text(val)
                }
                Spacer()
                    .padding(.bottom)
                Text("Instructions:")
                    .font(.headline)
                Text(instructions)
            }
            .padding([.leading, .trailing])
        }
    }
}

struct MealDetail_Preview: PreviewProvider {
    static var previews: some View {
        MealDetailsView(title: "Apam balik",
                        instructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.",
                        ingredients: ["200ml Milk","60ml Oil","2 Eggs","1600g Flour","3 tsp Baking Powder","1/2 tsp Salt","25g Unsalted Butter","45g Sugar","3 tbs Peanut Butter"],
                        imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }
}
