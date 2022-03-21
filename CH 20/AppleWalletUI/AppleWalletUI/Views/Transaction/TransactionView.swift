//
//  TransactionView.swift
//  AppleWalletUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
       RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(.systemGray5))
            .frame(width: 200, height: 300, alignment: .center)
            .overlay(
                VStack {
                                
                    Image(systemName: transaction.icon)
                        .font(.system(size: 50))
                        .padding(.bottom, 10)
                        
                    Text(transaction.merchant)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text("$\(String(format: "%0.1f", transaction.amount))")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .padding(.bottom, 30)
                    
                    Text(transaction.date)
                        .font(.system(.body, design: .rounded))
                                
                }
            )
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(transaction: testTransactions[0])
    }
}
