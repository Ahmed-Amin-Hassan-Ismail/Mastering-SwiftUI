//
//  ContentView.swift
//  TinderLikeUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    private let dragThreshold: CGFloat = 80.0
    
    @GestureState private var dragState: DragState = .inactive
    @State private var lastIndex = 1
    @State private var removalTransition = AnyTransition.trailingBottom
        
    @State var cardViews: [CardView] = {
        var views: [CardView] = []
        for index in 0..<2 {
            views.append(CardView(image: trips[index].image, title: trips[index].destination))
        }
        return views
    }()
    
    
    var body: some View {
        VStack {
            TopBarView()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView.zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width < -self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width > self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0 )
                            }
                        )
                    
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
                                y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.isTopCard(cardView: cardView) ? (self.dragState.isDragging ? 0.95 : 1.0) : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 10) : 0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100))
                        .transition(self.removalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating($dragState, body: { value, state, transaction in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                        })
                                    .onChanged({ value in
                            guard case .second(true, let drag?) = value else { return }
                            if drag.translation.width < -self.dragThreshold {
                                self.removalTransition = .leadingBottom
                            }
                        })
                                    .onEnded({ value in
                            guard case .second(true, let drag?) = value else { return }
                            if drag.translation.width < -self.dragThreshold  ||
                                drag.translation.width > self.dragThreshold {
                                self.moveCard()
                            }
                        })
                                 
                        )
                    
                }
            }
            
            Spacer(minLength:  20)
            
            BottomBarView()
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
    }
}

//MARK: - Helper Methods
extension ContentView {
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id })
        else { return false }
        return index == 0
    }
    
    private func moveCard() {
        cardViews.removeFirst()
        lastIndex += 1
        
        let trip = trips[lastIndex % trips.count]
        
        let newCardView = CardView(image: trip.image, title: trip.destination)
        cardViews.append(newCardView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView().previewLayout(.sizeThatFits)
        }
    }
}
