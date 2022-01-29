//
//  RestaurantListUIApp.swift
//  RestaurantListUI
//
//  Created by Ahmed Amin on 28/01/2022.
//

import SwiftUI

@main
struct RestaurantListUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(settingStore: SettingStore())
        }
    }
}
