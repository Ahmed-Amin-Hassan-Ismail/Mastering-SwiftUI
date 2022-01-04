//
//  ContentView.swift
//  PathShapeAndLineDrawingSwiftUI
//
//  Created by Ahmed Amin on 04/01/2022.
//

import SwiftUI

struct ContentView: View {
    private var purpuleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 6)
                .frame(width: 300, height: 300, alignment: .center)
            
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(purpuleGradient, lineWidth: 20)
                .frame(width: 300, height: 300, alignment: .center)
                .overlay(
                    VStack {
                        Text("%85")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                        Text("Completed")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(Color(.systemGray))
                                    
                    }
                )
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Demo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width,
                                      y: 0),
                          control: CGPoint(x: rect.size.width / 2,
                                           y: -(rect.size.height) / 2))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width,
                            height: rect.size.height))
        
        return path
    }
    
    
}
