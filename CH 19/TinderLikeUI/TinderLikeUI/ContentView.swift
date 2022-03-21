//
//  ContentView.swift
//  TinderLikeUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBarView()
            CardView(image: "yosemite-usa", title: "Yosemite, USA")
            Spacer(minLength:  20)
            BottomBarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView().previewLayout(.sizeThatFits)
        }
    }
}
