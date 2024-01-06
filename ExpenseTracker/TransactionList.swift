//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Mackley Magalhães da Silva on 05/01/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key ) { month, transactions in
                    Section {
                        ForEach(transactions) { transaction in
                                TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    
                }
                .listSectionSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TransactionList()
        .environmentObject(TransactionListViewModel())
}
#Preview {
    TransactionList()
        .environmentObject(TransactionListViewModel())
        .preferredColorScheme(.dark)
}
