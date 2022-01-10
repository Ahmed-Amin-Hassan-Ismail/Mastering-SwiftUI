//
//  ContentView.swift
//  DynamicList
//
//  Created by Ahmed Amin on 10/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    var restaurants = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
        Restaurant(name: "Homei", image: "homei"),
        Restaurant(name: "Homei", image: "upstate"),
        Restaurant(name: "Teakha", image: "teakha"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant(name: "Po's Atelier", image: "posatelier"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant(name: "Upstate", image: "upstate"),
        Restaurant(name: "Traif", image: "traif"),
        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
        Restaurant(name: "Five Leaves", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", image: "cafelore"),
        Restaurant(name: "Confessional", image: "confessional"),
        Restaurant(name: "Barrafina", image: "barrafina"),
        Restaurant(name: "Donostia", image: "donostia"),Restaurant(name: "Royal Oak", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        List(restaurants ) { restaurant in
                     
            FullImagesRestaurantRow(restaurant: restaurant)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicRestaurantRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(5)
            
            Text(restaurant.name)
        }
    }
}


struct FullImagesRestaurantRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(nil, contentMode: .fill)
                .frame(width: .infinity, height: 300, alignment: .center)
            
            Text(restaurant.name)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
        
            Text("By Ahmed Amin")
                .font(.system(.body, design: .rounded))
                .foregroundColor(Color(.systemGray2))
            
            HStack {
                ForEach(0...3, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundColor(.yellow)
                }
            }
            
            Text("Building a list view with complex row layout")
                .font(.system(.body, design: .rounded))
                .foregroundColor(Color(.systemGray2))
                                    
        }
        
    }
    
    
}

