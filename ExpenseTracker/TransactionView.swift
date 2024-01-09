//
//  TransactionView.swift
//  ExpenseTracker
//
//  Created by Mackley Magalhães da Silva on 06/01/24.
//

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction
    var body: some View {
        List {
            VStack(spacing: 6) {
                Text(transaction.signedAmount, format: .currency(code: "USD"))
                    .font(.largeTitle)
                    .bold()
                
                Text(transaction.merchant)
                    .lineLimit(1)
                
                Text(transaction.dateParse, format: .dateTime.year().month(.wide).day())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden, edges: .top)
            .padding(.vertical, 16)
            
            TransactionDetailRow(icon: .store, title: "Merchant", text: transaction.merchant)
            
            TransactionDetailRow(icon: .calendar, title: "Date", text: transaction.dateParse.formatted(.dateTime.year().month(.wide).weekday(.wide)))
            
            TransactionDetailRow(icon: .landmark, title: "Finacial Institution", text: transaction.institution)
            
            TransactionDetailRow(icon: .credit_card, title: "Account", text: transaction.account)
            
            NavigationLink {
                CategoriesView(transaction: transaction)
            } label: {
                TransactionDetailRow(icon: .list, title: "Category", text: transaction.categoryItem.name)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        TransactionView(transaction: transactionPreviewData)
    }
}
