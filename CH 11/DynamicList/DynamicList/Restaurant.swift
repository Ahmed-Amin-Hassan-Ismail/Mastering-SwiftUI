//
//  Restaurant.swift
//  DynamicList
//
//  Created by Ahmed Amin on 10/01/2022.
//

import Foundation


struct Restaurant: Hashable, Identifiable {
    
    var id = UUID()
    var name: String
    var image: String
    
}
