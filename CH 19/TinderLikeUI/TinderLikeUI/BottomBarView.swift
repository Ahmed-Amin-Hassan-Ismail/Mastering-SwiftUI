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
                    .font(.subheadline)
                    .bold()
                    .padding(.horizontal, 35)
                    .padding(.vertical, 15)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
            }
            //padding(.horizontal, 35)
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 30))
        }
        .padding(.horizontal, 50)
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}
