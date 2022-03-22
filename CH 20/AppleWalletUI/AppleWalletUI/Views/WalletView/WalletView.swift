//
//  WalletView.swift
//  AppleWalletUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import SwiftUI

struct WalletView: View {
    var cards: [Card] = testCards
    private static let cardOffset: CGFloat = 50.0
    
    var body: some View {
        VStack {
            
            TopNavBarView()
            
            Spacer()
            
            ZStack {
                ForEach(cards) { card in
                    CardView(card: card)
                        .padding(.horizontal, 35)
                        .zIndex(self.zIndex(for: card))
                        .offset(self.offset(for: card))
                }
            }
            
            Spacer()
        }
        
    }
}

//MARK: - Helper Methods
extension WalletView {
    
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else { return 0.0 }
        return -Double(cardIndex)
    }
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: {
            $0.id == card.id
        }) else { return nil }
        return index
    }
    
    private func offset(for card: Card) -> CGSize {
        guard let cardIndex = index(for: card) else { return CGSize() }
        return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
