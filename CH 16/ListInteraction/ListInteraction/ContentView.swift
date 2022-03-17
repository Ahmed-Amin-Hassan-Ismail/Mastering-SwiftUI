//
//  ContentView.swift
//  ListInteraction
//
//  Created by Ahmed Amin on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var restaurants = [Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                              Restaurant(name: "Homei", image: "homei"),
                              Restaurant(name: "Teakha", image: "teakha"),
                              Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                              Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                              Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                              Restaurant(name: "Po's Atelier", image: "posatelier"),
                              Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                              Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                              Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                              Restaurant(name: "Homei", image: "upstate"),
                              Restaurant(name: "Traif", image: "traif"),
                              Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                              Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
                              Restaurant(name: "Five Leaves", image: "fiveleaves"),
                              Restaurant(name: "Cafe Lore", image: "cafelore"),
                              Restaurant(name: "Confessional", image: "confessional"),
                              Restaurant(name: "Barrafina", image: "barrafina"),
                              Restaurant(name: "Donostia", image: "donostia"),
                              Restaurant(name: "Royal Oak", image: "royaloak"),
                              Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    @State private var selectedRestaurant: Restaurant?
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                        .contextMenu(menuItems: {
                            Button {
                                // perform selected delete row
                                self.delete(item: restaurant)
                            } label: {
                                HStack {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                            
                            Button {
                                // perform seleted favorite
                                self.setFavoriteRestaurant(item: restaurant)
                            } label: {
                                HStack {
                                    Text("Favorite")
                                    Image(systemName: "star")
                                }
                            }
                            
                            Button {
                                self.setCheckInRestaurant(item: restaurant)
                            } label: {
                                HStack {
                                    Text("Check-in")
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            }

                            
                            
                        })
                        .onTapGesture {
                            self.selectedRestaurant = restaurant
                        }
                }
                .onDelete(perform: { indexSet in
                    self.restaurants.remove(atOffsets: indexSet)
                })
                .actionSheet(item: $selectedRestaurant, content: { restaurant in
                    ActionSheet(title: Text("what do you want to do?"), message: nil, buttons: [
                        .default(Text("Mark as Favorite"), action: {
                            self.setFavoriteRestaurant(item: restaurant)
                        }),
                        .destructive(Text("Delete"), action: {
                            self.delete(item: restaurant)
                        })
                        
                    ])
                })
                .navigationTitle("Restaurant")
                
            }
        }
    }
    
    private func delete(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    private func setFavoriteRestaurant(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id
        }) {
            self.restaurants[index].isFaborite.toggle()
        }
    }
    
    private func setCheckInRestaurant(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: {
            $0.id == restaurant.id
        }) {
            self.restaurants[index].isCheckIn.toggle()
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
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(5)
            
            
            Text(restaurant.name)
            
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            
            if restaurant.isFaborite {
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
