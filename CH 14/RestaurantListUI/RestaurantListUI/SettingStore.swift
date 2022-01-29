//
//  SettingStore.swift
//  RestaurantListUI
//
//  Created by Ahmed Amin on 29/01/2022.
//

import Foundation
import Combine




enum DisplayOrderType: Int, CaseIterable {
    case alphabetical = 0
    case favoriteFirst = 1
    case checkInFirst = 2
    
    init(type: Int) {
        switch type {
        case 0:
            self = .alphabetical
        case 1:
            self = .favoriteFirst
        case 2:
            self = .checkInFirst
        default:
            self = .alphabetical
        }
    }
    
    var text: String {
        switch self {
        case .alphabetical:
            return "Alphabetical"
        case .favoriteFirst:
            return "Show Favorite First"
        case .checkInFirst:
            return "Check-in First"
        }
    }
}



final class SettingStore: ObservableObject {
    @Published  var defaults: UserDefaults
    
    /// init the class
    init (defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        /// store the user's settings
        defaults.register(defaults: [
            "view.preferences.showCheckInOnly" : false,
            "view.preferences.displayOrder" : 0,
            "view.preferences.maxPriceLevel" : 5
        ])
    }
    
    var showCheckInOnly: Bool {
        get {
            defaults.bool(forKey: "view.preferences.showCheckInOnly")
        }
        set {
            defaults.set(newValue, forKey: "view.preferences.showCheckInOnly")
        }
    }
     
    var displayOrder: DisplayOrderType {
        get {
            DisplayOrderType(type: defaults.integer(forKey: "view.preferences.displayOrder"))
        }
        set {
            defaults.set(newValue.rawValue, forKey: "view.preferences.displayOrder")
        }
    }
    
    var maxPriceLevel: Int {
        get {
            defaults.integer(forKey: "view.preferences.maxPriceLevel")
        }
        set {
            defaults.set(newValue, forKey: "view.preferences.maxPriceLevel")
        }
    }
}
