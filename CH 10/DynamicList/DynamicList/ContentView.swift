//
//  ContentView.swift
//  DynamicList
//
//  Created by Ahmed Amin on 10/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(0...4, id: \.self) {
                Text("item\($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
