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
            Text("Loading...")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .background(Color(.systemGray6))
                .frame(width: 250, height: 10, alignment: .center)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(.green, lineWidth: 3)
                .frame(width: 50, height: 3, alignment: .center)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false))
            
            
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
