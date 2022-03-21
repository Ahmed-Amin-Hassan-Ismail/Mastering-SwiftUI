//
//  CardView.swift
//  AppleWalletUI
//
//  Created by Ahmed Amin on 22/03/2022.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text(card.number)
                        .font(.headline)
                        .bold()
                    
                    HStack {
                        Text(card.name)
                            .font(.subheadline)
                            .bold()
                        
                        Text("Valid Thru")
                            .font(.footnote)
                        
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                }
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                    .padding(.bottom, 25)
                
                ,alignment: .leading
            )
            .shadow(color: .gray, radius: 1, x: 0, y: 1)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: testCards[0])
    }
}
