//
//  ContentView.swift
//  Gesture
//
//  Created by Ahmed Amin on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed: Bool = false
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
       Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            .animation(.easeInOut)
            .foregroundColor(.green)
        
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, transaction in
                        state = value.translation
                    })
                    .onEnded({ value in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
