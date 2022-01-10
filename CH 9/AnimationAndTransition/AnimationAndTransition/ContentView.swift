//
//  ContentView.swift
//  AnimationAndTransition
//
//  Created by Ahmed Amin on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300, alignment: .center)
                .foregroundColor(.green)
                .overlay(
                    Text("Show details.")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                    
                )
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300, alignment: .center)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
                    .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0)))
            }
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.show.toggle()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
