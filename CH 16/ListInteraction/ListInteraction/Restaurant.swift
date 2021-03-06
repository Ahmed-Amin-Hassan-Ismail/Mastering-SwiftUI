//
//  Restaurant.swift
//  ListInteraction
//
//  Created by Ahmed Amin on 31/01/2022.
//

import Foundation



struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var isFaborite: Bool = false
    var isCheckIn: Bool = false 
}
