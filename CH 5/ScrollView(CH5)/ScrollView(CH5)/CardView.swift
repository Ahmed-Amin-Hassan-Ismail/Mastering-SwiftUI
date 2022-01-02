//
//  CardView.swift
//  ScrollView(CH5)
//
//  Created by Ahmed Amin on 02/01/2022.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var category: String
    var heading: String
    var author: String
    
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(nil, contentMode: .fit)
            
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(category)
                        .font(.system(.headline, design: .default))
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.system(.title, design: .default))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                Spacer(minLength: nil)
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.init(srgbRed: 150/255, green: 150/255, blue: 150/255, alpha: 0.4)), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
    }
}
