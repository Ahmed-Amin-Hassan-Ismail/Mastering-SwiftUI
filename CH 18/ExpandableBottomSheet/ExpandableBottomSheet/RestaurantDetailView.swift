//
//  RestaurantDetailView.swift
//  ExpandableBottomSheet
//
//  Created by Ahmed Amin on 18/03/2022.
//

import SwiftUI

enum ViewState {
    case full
    case half
}

struct RestaurantDetailView: View {
    @GestureState private var dragState: DragState = .inactive
    @State private var positionOffset: CGFloat = 0.0
    @State private var viewState: ViewState = .half
    let restaurant: Restaurant
    @Binding var isShow: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HandleBar()
                
                ScrollView(.vertical) {
                    TitleBar()
                    
                    HeaderView(restaurant: self.restaurant)
                    
                    DetailInfoView(icon: "map", info: self.restaurant.location)
                        .padding(.top)
                        .padding(.bottom, 5)
                    
                    DetailInfoView(icon: "phone", info: self.restaurant.phone)
                    
                    DetailInfoView(icon: nil, info: self.restaurant.description)
                        .padding(.top)
                }
                .animation(nil)
                .disabled((self.viewState == .half) || (self.dragState.isDragging))
                .background(.white)
                .cornerRadius(10, antialiased: true)
                
            }
            .offset(y: geometry.size.height / 2 + self.dragState.translation.height + self.positionOffset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .edgesIgnoringSafeArea(.all)
            .gesture(DragGesture()
                        .updating($dragState, body: { value, state, transaction in
                state = .dragging(transaction: value.translation)
            })
                        .onEnded({ value in
                switch self.viewState {
                case .half:
                    
                    if value.translation.height < -geometry.size.height * 0.25 {
                        self.positionOffset = -geometry.size.height/2 + 50
                        self.viewState = .full
                    }
                    
                    if value.translation.height > geometry.size.height * 0.3 {
                        self.isShow = false
                    }
                    
                case .full:
                    
                    if value.translation.height > geometry.size.height * 0.25 {
                        self.positionOffset = 0
                        self.viewState = .half
                    }
                    
                    if value.translation.height > geometry.size.height * 0.75 {
                        self.isShow = false
                    }
                }
            })
            )
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: restaurants[0], isShow: .constant(true))
            .background(Color.black.opacity(0.3))
            .edgesIgnoringSafeArea(.all)
    }
}

//MARK: - HandleBar
struct HandleBar: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5, alignment: .center)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
    }
}

//MARK: - Title Bar
struct TitleBar: View {
    
    var body: some View {
        HStack {
            Text("Restaurant Detail")
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
    }
}

//MARK: - Header View
struct HeaderView: View {
    let restaurant: Restaurant
    
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(width: nil, height: 300, alignment: .center)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(restaurant.name)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        
                        Text(restaurant.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(5)
                    }
                    Spacer()
                }
                    .padding()
                
            )
    }
}


//MARK: - Detail Info View
struct DetailInfoView: View {
    let icon: String?
    let info: String
    
    var body: some View {
        HStack {
            icon.map {
                Image(systemName: $0)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal)
    }
}
