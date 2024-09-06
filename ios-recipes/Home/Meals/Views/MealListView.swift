//
//  MealListView.swift
//  ios-recipes
//
//  Created by Alexis Urquiza on 9/4/24.
//

import SwiftUI

struct MealListView: View {
    var mealList: [MealItem] = []
    var category: String
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Text(category)
            List {
                ForEach(mealList, id: \.mealId) { item in
                    ZStack {
                        NavigationLink("", value: MealsNavigation.MealDetails(item.mealId))
                        .opacity(0)
                        ListItem(mealItem: item)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, 
                                         leading: 0,
                                         bottom: 8,
                                         trailing: 0))
                }
            }
            .padding([.leading, .trailing])
            .listStyle(.inset)
            
        }
        
    }
    
    func ListItem(mealItem: MealItem) -> some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: mealItem.imageUrl), scale: 1) { val in
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
            .frame(width: 50, height: 50)
            
            Text(mealItem.mealTitle)
                .foregroundStyle(.white)
            Spacer()
        }
        .background(.indigo)
        
    }
}

struct List_Preview: PreviewProvider {
    static var previews: some View {
        MealListView(
            mealList: [
            MealItem(mealId: "1", mealTitle: "Apam balik", imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
            MealItem(mealId: "2", mealTitle: "Apple & Blackberry Crumble", imageUrl: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
            MealItem(mealId: "3", mealTitle: "Apple Frangipan Tart", imageUrl: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")
        ],
            category: "Dessert")
    }
}
