//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Mackley Magalhães da Silva on 05/01/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    TransactionList()
                        .environmentObject(transactionListVM)
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.offset) { index, transaction in
                NavigationLink {
                    TransactionView(transaction: transaction)
                } label: {
                    TransactionRow(transaction: transaction)
                }
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    RecentTransactionList()
        .environmentObject(TransactionListViewModel())
}

#Preview {
    RecentTransactionList()
        .environmentObject(TransactionListViewModel())
        .preferredColorScheme(.dark)
}
