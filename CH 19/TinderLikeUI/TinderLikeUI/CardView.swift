//
//  CardView.swift
//  TinderLikeUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import SwiftUI

struct CardView: View, Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var body: some View {
        
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
            .cornerRadius(10)
            .padding(.horizontal, 15)
            .overlay(
                
                Text(title)
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(.white)
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                ,alignment: .bottom
            )
        
        
        
        
        
        
        
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "barcelona-spain", title: "Mount Currie, Canada")
    }
}
