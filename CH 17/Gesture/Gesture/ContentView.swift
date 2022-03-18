//
//  ContentView.swift
//  Gesture
//
//  Created by Ahmed Amin on 17/03/2022.
//

import SwiftUI

struct ContentView: View {

    @GestureState private var scaleGesture: CGFloat = 1.0
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .scaleEffect(scaleGesture)
            .animation(.easeInOut)
            .foregroundColor(.green)
            .gesture(
                MagnificationGesture()
                    .updating($scaleGesture, body: { currentState, state, transaction in
                        state =  currentState
                    })
                
                
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
