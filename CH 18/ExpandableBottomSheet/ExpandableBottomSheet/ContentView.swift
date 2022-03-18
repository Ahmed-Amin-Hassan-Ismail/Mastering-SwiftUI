//
//  ContentView.swift
//  ExpandableBottomSheet
//
//  Created by Ahmed Amin on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    @State private var selectedRestaurant: Restaurant?
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(restaurants) { restaurant in
                        BasicImageRow(restaurant: restaurant)
                            .onTapGesture {
                                self.showDetail = true
                                self.selectedRestaurant = restaurant
                            }
                    }
                    
                }
                
                .navigationBarTitle("Restaurants")
            }
            
            if showDetail {
                BlankView(bgColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showDetail = false 
                    }
                selectedRestaurant.map {
                    RestaurantDetailView(restaurant: $0)
                        .transition(.move(edge: .bottom))
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - Basic Row
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

//MARK: - Blank View
struct BlankView: View {
    var bgColor: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .center)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

