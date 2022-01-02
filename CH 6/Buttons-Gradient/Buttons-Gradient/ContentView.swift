//
//  ContentView.swift
//  Buttons-Gradient
//
//  Created by Ahmed Amin on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
  
            // how it looks like
            
            VStack {
                Spacer()
                
                CreateButton(icon: "square.and.arrow.up", title: "Share")
                CreateButton(icon: "square.and.pencil", title: "Edit")
                CreateButton(icon: "trash", title: "Delete")
                
                Spacer()
                
                Button {
                    print("Circular button is clicked")
                } label: {
                    Image(systemName: "plus")
                }
                .buttonStyle(CircularButton())
                
             Spacer()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CreateButton: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        
        Button {
            print("Button \(title) clicked")
        } label: {
            HStack {
                Image(systemName: icon)
                    .font(.largeTitle)
                Text(title)
                    .font(.title)
            }
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}


struct GradientBackgroundStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("lightGreen")]),
                                       startPoint: .leading,
                                       endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
           
    }
}


struct CircularButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.purple)
            .cornerRadius(40)
            .rotationEffect(configuration.isPressed ? Angle(degrees: 135) : Angle(degrees: 0) )
    }
}
