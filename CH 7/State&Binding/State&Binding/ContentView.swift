//
//  ContentView.swift
//  State&Binding
//
//  Created by Ahmed Amin on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying: Bool = false
    @State private var pressCounter: Int = 0
    
    var body: some View {
        
        VStack {
            Button {
                print("Play button is clicked")
                self.isPlaying.toggle()
                
            } label: {
                Image(systemName: isPlaying ?  "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 150))
                    .foregroundColor(isPlaying ?  .red : .green)
        }
            
            Button {
                print("Counter is increased")
                self.pressCounter += 1
            } label: {
                Circle()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.red)
                    .overlay(
                        Text("\(pressCounter)")
                            .font(.system(size: 100, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    )
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
