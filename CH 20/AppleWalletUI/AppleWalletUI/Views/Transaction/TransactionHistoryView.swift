//
//  TransactionHistoryView.swift
//  AppleWalletUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    var transactions: [Transaction]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Transaction History")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .padding()
            
            ScrollView(.horizontal) {
                
                HStack(alignment: .center, spacing: 30) {
                    ForEach(transactions) { transaction in
                        TransactionView(transaction: transaction)
                    }
                }
                .padding()
            }
                
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView(transactions: testTransactions)
    }
}
