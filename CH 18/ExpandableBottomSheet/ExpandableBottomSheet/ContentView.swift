//
//  ContentView.swift
//  ExpandableBottomSheet
//
//  Created by Ahmed Amin on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                }
            }
            
            .navigationBarTitle("Restaurants")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}
