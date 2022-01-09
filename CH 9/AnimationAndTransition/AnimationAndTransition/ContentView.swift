//
//  ContentView.swift
//  AnimationAndTransition
//
//  Created by Ahmed Amin on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0.0
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 20)
                .frame(width: 250, height: 250, alignment: .center)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.green, lineWidth: 20)
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(Angle(degrees: -90))
            
            
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                        self.progress += 0.05
                        print("progress \(self.progress)")
                        if self.progress >= 1.01 {
                            self.progress = 0.0
                            //timer.invalidate()
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
