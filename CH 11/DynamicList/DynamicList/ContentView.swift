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
    
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font: UIFont(name: "ArialRoundedMTBold", size: 35)!
        ]
        
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font: UIFont(name: "ArialRoundedMTBold", size: 20)!
        ]
        
        navigationBarAppearance.setBackIndicatorImage(
            UIImage(systemName: "arrow.turn.up.left"),
            transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        
        UINavigationBar.appearance().tintColor = UIColor.black
    }
    var body: some View {
        
        NavigationView {
            List(restaurants) { restaurant in
                                
                NavigationLink(destination: RestaurantViewDetail(restaurant: restaurant)) {
                    BasicRestaurantRow(restaurant: restaurant)
                }
            }
            .navigationTitle("Restaurant")
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct RestaurantViewDetail: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(nil, contentMode: .fill)
                .clipped()
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
        }
        Spacer()
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
