//
//  ContentView.swift
//  AnimationAndTransition
//
//  Created by Ahmed Amin on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack {
        Circle()
            .stroke(Color(.systemGray5))
            .frame(width: 200, height: 200, alignment: .center)
            
            
            
        Circle()
            .trim(from: 0, to: 0.2)
            .stroke(Color.green, lineWidth: 10)
            .frame(width: 180, height: 180, alignment: .center)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            
            
            Circle()
                .stroke(Color(.systemGray5))
                .frame(width: 160, height: 160, alignment: .center)
            
                .onAppear {
                self.isLoading = true
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
