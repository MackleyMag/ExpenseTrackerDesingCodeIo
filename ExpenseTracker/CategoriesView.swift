//
//  CategoriesView.swift
//  ExpenseTracker
//
//  Created by Mackley Magalhães da Silva on 08/01/24.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            ForEach(Category.categories) { category in
                Section {
                    ForEach(category.subCategories ?? []) { subcategory in
                        let isSelected = transaction.categoryId == subcategory.id
                        
                        CategoryRow(category: subcategory, isSelected: isSelected)
                            .onTapGesture {
                                transactionListVM.updateCategory(transaction: transaction, category: subcategory)
                                dismiss()
                            }
                    }
                } header: {
                    let isSelected = transaction.categoryId == category.id
                    
                    CategoryRow(category: category, isSelected: isSelected)
                        .onTapGesture {
                            transactionListVM.updateCategory(transaction: transaction, category: category)
                            dismiss()
                        }
                }

            }
        }.listStyle(.plain)
            .navigationTitle("Category")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoriesView(transaction: transactionPreviewData)
        .environmentObject(TransactionListViewModel())
}
#Preview {
    CategoriesView(transaction: transactionPreviewData)
        .environmentObject(TransactionListViewModel())
        .preferredColorScheme(.dark)
}
