//
//  ContentView.swift
//  Gesture
//
//  Created by Ahmed Amin on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed: Bool = false
    
    var body: some View {
       Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .foregroundColor(.green)
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .gesture(
                TapGesture()
                    .onEnded({ _ in
                        self.isPressed.toggle()
                    })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
