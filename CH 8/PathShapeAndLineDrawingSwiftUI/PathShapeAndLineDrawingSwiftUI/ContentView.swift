//
//  ContentView.swift
//  PathShapeAndLineDrawingSwiftUI
//
//  Created by Ahmed Amin on 04/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button {
            
        } label: {
            Text("Hit Me")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .frame(width: 250, height: 50, alignment: .center)
                .background(Demo().fill(.red))
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
