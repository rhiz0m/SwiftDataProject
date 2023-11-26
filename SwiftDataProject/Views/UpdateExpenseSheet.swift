//
//  UpdateSheet.swift
//  SwiftDataProject
//
//  Created by Andreas Antonsson on 2023-11-26.
//

import SwiftUI

struct UpdateExpenseSheet: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var expense: Expense
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name: ", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.value, format: .currency(code: "SEK"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Update Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Update") { dismiss() }
                }
            }
        }
    }
}
