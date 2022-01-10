//
//  ContentView.swift
//  AnimationAndTransition
//
//  Created by Ahmed Amin on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var processing: Bool = false
    @State private var completed: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: processing ? 250 : 200, height: 60, alignment: .center)
                .foregroundColor(completed ? .red : .green)
            
            if !processing {
                Text("Submit")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .transition(.move(edge: .top))
            }
            
            if processing && !completed {
                HStack {
                    Circle()
                        .trim(from: 0, to: 0.9)
                        .stroke(.white, lineWidth: 3)
                        .frame(width: 30, height: 30, alignment: .center)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(.easeInOut.repeatForever(autoreverses: false))
                    
                    Text("Processing")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
                .transition(.opacity)
                .onAppear {
                    self.isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.completed = true
                    }
                }
            }
            
            if completed {
                Text("Done")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.processing = false
                            self.completed = false
                            self.isLoading = false
                        }
                    }
            }
        }
        
        .animation(.spring())
        .onTapGesture {
            self.processing = true
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
