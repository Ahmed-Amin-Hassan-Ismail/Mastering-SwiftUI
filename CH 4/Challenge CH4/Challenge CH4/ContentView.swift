//
//  ContentView.swift
//  Challenge CH4
//
//  Created by Ahmed Amin on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            PricingView(icon: "sun.max.fill", title: "Basic", textColor: .white, bgColo: .purple)
                .padding()
                .offset(x: 0, y: -220)
            
            PricingView(icon: "cloud.sun.rain.fill", title: "Pro", textColor: .white, bgColo: .orange)
                .padding()
                .offset(x: 0, y: -100)
            
            PricingView(icon: "wand.and.rays", title: "Team", price: "$299", perMonth: "per month", textColor: .white, bgColo: Color(red: 62/255, green: 63/255, blue: 70/255))
                .padding()
                .offset(x: 0, y: 20)
                
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PricingView: View {
    
    var icon: String
    var title: String
    var price: String?
    var perMonth: String?
    var textColor: Color
    var bgColo: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(.title, design: .rounded))
                .foregroundColor(textColor)
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            price.map {
                Text($0)
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(textColor)
            }
            perMonth.map {
                Text($0)
                    .font(.headline)
                    .foregroundColor(textColor)
            }
            
            Spacer(minLength: nil)
        }
        .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 200, idealHeight: nil, maxHeight: 300, alignment: .center)
        .padding(40)
        .background(bgColo)
        .cornerRadius(10)
        
    }
}
