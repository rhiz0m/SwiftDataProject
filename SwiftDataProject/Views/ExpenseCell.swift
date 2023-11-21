//
//  ExpenseCell.swift
//  SwiftDataProject
//
//  Created by Andreas Antonsson on 2023-11-21.
//

import SwiftUI

struct ExpenseCell: View {
    
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.name)
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
            Text(expense.value, format: .currency(code: "SEK"))
        }
    }
}

#Preview {
    ExpenseCell(expense: Expense(name: "Playstation", date: Date(), value: 10000))
}
