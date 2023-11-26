//
//  AddExpenseSheet.swift
//  SwiftDataProject
//
//  Created by Andreas Antonsson on 2023-11-21.
//

import SwiftUI

struct AddExpenseSheet: View {
    // works because we injected it in the root (swiftDataProjectApp)
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name: ", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Value", value: $value, format: .currency(code: "SEK"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let expense = Expense(name: name, date: date, value: value)
                        context.insert(expense)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddExpenseSheet()
}

// Work with the Context first before you save it in the Container
