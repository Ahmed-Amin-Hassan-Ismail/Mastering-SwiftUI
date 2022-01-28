//
//  Restaurant.swift
//  RestaurantListUI
//
//  Created by Ahmed Amin on 28/01/2022.
//

import Foundation



struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}
