//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Mackley Magalhães da Silva on 20/12/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    CardView {
                        VStack {
                            ChartLabel("&900", type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: .systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 300)
                    
                    RecentTransactionList()
                        .environmentObject(TransactionListViewModel())
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}
#Preview {
    Group {
        ContentView()
            .environmentObject(TransactionListViewModel())
    }
}
#Preview {
    Group {
        ContentView()
            .environmentObject(TransactionListViewModel())
            .preferredColorScheme(.dark)
    }
}
