//
//  BottomBarView.swift
//  TinderLikeUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import SwiftUI

struct BottomBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 30))
            Spacer()
            Button {
                
            } label: {
                Text("book it now".uppercased())
                    .font(.headline)
                    .bold()
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
            }
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 30))
        }
        .padding()
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}
