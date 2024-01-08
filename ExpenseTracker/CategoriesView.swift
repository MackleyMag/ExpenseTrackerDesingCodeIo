//
//  CategoriesView.swift
//  ExpenseTracker
//
//  Created by Mackley Magalhães da Silva on 08/01/24.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    
    
    
    var body: some View {
        List {
            ForEach(Category.categories) { category in
                Section {
                    ForEach(category.subCategories ?? []) { subcategory in
                        let isSelected = transaction.categoryId == subcategory.id
                        
                        CategoryRow(category: subcategory, isSelected: isSelected)
                    }
                } header: {
                    let isSelected = transaction.categoryId == category.id
                    
                    CategoryRow(category: category, isSelected: isSelected)
                }

            }
        }.listStyle(.plain)
            .navigationTitle("Category")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoriesView(transaction: transactionPreviewData)
}
#Preview {
    CategoriesView(transaction: transactionPreviewData)
        .preferredColorScheme(.dark)
}
