//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Ahmed Amin on 30/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            HeaderView()
            
            HStack(alignment: .center, spacing: 5) {
                PricingView(title: "Basic",
                            price: "$9",
                            textColor: .white,
                            bgColor: .purple)
                
                ZStack {
                    PricingView(title: "Pro",
                                price: "$19",
                                textColor: .black,
                                bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    Text("Best for designer")
                    
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 1, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                    
                }
                
                
            }
            .padding(.horizontal)
            
            
            ZStack {
                
                PricingView(icon: "wand.and.rays", title: "Team", price: "299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255))
                    .padding()
                
                Text("Perfect for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 1, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 110)
            }
            
            Spacer(minLength: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer(minLength: nil)
        }
        .padding()
    }
}

struct PricingView: View {
    
    var icon: String?
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack {
            
            icon.map {
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text("$9")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 100, idealHeight: nil, maxHeight: nil, alignment: .center)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
        
    }
    
}
