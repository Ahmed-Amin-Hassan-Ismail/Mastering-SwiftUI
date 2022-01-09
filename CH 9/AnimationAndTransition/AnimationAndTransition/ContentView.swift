//
//  ContentView.swift
//  AnimationAndTransition
//
//  Created by Ahmed Amin on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circleColorChange = false
    @State private var heartColorChange = false
    @State private var heartSizeChange = false
    
    var body: some View {
        ZStack {
            
            Circle()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(circleColorChange ? Color(.systemGray5) : Color(.systemRed))
                
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChange ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChange ? 1 : 0.5)
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3), value: 1)
        .onTapGesture {
            self.circleColorChange.toggle()
            self.heartColorChange.toggle()
            self.heartSizeChange.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
