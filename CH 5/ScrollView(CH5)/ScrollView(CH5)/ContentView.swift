//
//  ContentView.swift
//  ScrollView(CH5)
//
//  Created by Ahmed Amin on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Monday, Aug 20")
                        .font(.system(.caption, design: .default))
                        .foregroundColor(.secondary)
                    Text("Your Reading")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                }
                .layoutPriority(100)
                Spacer(minLength: nil)
            }
            .padding([.top, .horizontal])
            .layoutPriority(-100)
            HStack {
                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                    .frame(width: 350)
                
                CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                    .frame(width: 350)
                
                CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                    .frame(width: 350)
                
                CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
                    .frame(width: 350)
            }
            //.layoutPriority(100)
            
            Spacer(minLength: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
