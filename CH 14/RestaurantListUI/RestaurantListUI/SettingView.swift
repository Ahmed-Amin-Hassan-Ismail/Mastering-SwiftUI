//
//  SettingView.swift
//  RestaurantListUI
//
//  Created by Ahmed Amin on 28/01/2022.
//

import SwiftUI

struct SettingView: View {
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var maxPriceLevel = 5
    @State private var showCheckIn = false
    @Environment(\.presentationMode) var presentationMode
    var settingStore: SettingStore
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedOrder) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.text)
                        }
                    } label: {
                        Text("Display Order")
                    }
                } header: {
                    Text("SORT PREFERENCE")
                }
                
                
                Section {
                    Toggle(isOn: $showCheckIn) {
                        Text("Show Check-in Only")
                    }
                    
                    Stepper {
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    } onIncrement: {
                        self.maxPriceLevel += 1
                        
                        if self.maxPriceLevel >= 5 {
                            self.maxPriceLevel = 5
                        }
                    } onDecrement: {
                        self.maxPriceLevel -= 1
                        
                        if self.maxPriceLevel <= 1 {
                            self.maxPriceLevel = 1
                        }
                    }
                    
                    
                    
                } header: {
                    Text("FILTER PREFERENCE")
                }
                
                .navigationTitle("Settings")
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }), trailing: Button(action: {
                    self.settingStore.showCheckInOnly = self.showCheckIn
                    self.settingStore.displayOrder = self.selectedOrder
                    self.settingStore.maxPriceLevel = self.maxPriceLevel
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                        .foregroundColor(.black)
                }))
            }
        }
        
        .onAppear {
            self.showCheckIn = self.settingStore.showCheckInOnly
            self.selectedOrder = self.settingStore.displayOrder
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(settingStore: SettingStore())
    }
}
