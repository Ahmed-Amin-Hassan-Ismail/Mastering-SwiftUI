//
//  ContentView.swift
//  AnimationAndTransition
//
//  Created by Ahmed Amin on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var recordBegin: Bool = false
    @State private var recording: Bool = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250 ,
                       height: 60, alignment: .center)
                .foregroundColor(recordBegin ? .red : .green)
            
            Image(systemName: "mic.fill")
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
                .scaleEffect(recording ? 0.7 : 1.0)
            
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 10)
                .trim(from: 0, to: recordBegin ? 0 : 1)
                .stroke(.green, lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260,
                       height: 70,
                       alignment: .center)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.recordBegin.toggle()
            }
            withAnimation(.spring().repeatForever(autoreverses: false).delay(0.5)) {
                self.recording.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
