//
//  ContentView.swift
//  State&Binding
//
//  Created by Ahmed Amin on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying: Bool = false
    @State private var blueCounter: Int = 0
    @State private var greenCounter: Int = 0
    @State private var redCounter: Int = 0
    
    var body: some View {
        
        
        
        VStack {
            Spacer()
            
            Text("\(blueCounter + greenCounter + redCounter)")
                .font(.system(size: 150, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .padding()
            
            Spacer()
            
            HStack {
                CircularButton(colorSelected: .blue, counter: $blueCounter)
                CircularButton(colorSelected: .green, counter: $greenCounter)
                CircularButton(colorSelected: .red, counter: $redCounter)
            }
            
            Spacer()
           



        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircularButton: View {
    
    var colorSelected: Color
    @Binding var counter: Int
    
    
    var body: some View {
        Button {
            print("The \(colorSelected.description) button is tapped ")
            self.counter += 1
        } label: {
            Circle()
                .frame(width: 120, height: 120, alignment: .center)
                .foregroundColor(colorSelected)
                .overlay(
                    Text("\(self.counter)")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}
