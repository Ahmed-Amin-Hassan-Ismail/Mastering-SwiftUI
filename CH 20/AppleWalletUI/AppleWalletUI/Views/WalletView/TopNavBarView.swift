//
//  TopNavBarView.swift
//  AppleWalletUI
//
//  Created by Ahmed Amin on 22/03/2022.
//

import SwiftUI

struct TopNavBarView: View {
    
    var body: some View {
        
        HStack {
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct TopNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavBarView()
    }
}
