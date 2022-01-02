//
//  ContentView.swift
//  Buttons-Gradient
//
//  Created by Ahmed Amin on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button {
            // what to perform
        } label: {
            // how it looks like
            VStack {
                
                Text("Hello World")
                    .font(.system(.title, design: .rounded))
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.purple, lineWidth: 5)
                        
                    )
                
                HStack {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                    Text("Delete")
                        .font(.title)
                }
                .foregroundColor(.white)
                .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
                .padding()
                .background(Color.red)
                .cornerRadius(40)
                
                
                HStack {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                    Text("Delete")
                        .font(.title)
                }
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("lightGreen")]),
                                           startPoint: .leading,
                                           endPoint: .trailing))
                .cornerRadius(40)
                .shadow(color: .gray, radius: 20, x: 20, y: 10)
            }
            
            .padding(.horizontal, 20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


