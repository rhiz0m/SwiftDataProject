//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Andreas Antonsson on 2023-11-21.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State var isShowingItemSheet = false
    
    @Query(filter: #Predicate<Expense> { $0.value > 3000 }, sort: \Expense.date)
    var expenses: [Expense] // Fetch and sort by all expenses over 3000
    
    //@Query(sort: \Expense.date) var expenses: [Expense] // This is how we fetch the Expenses
    @State private var expenseToEdit: Expense?
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                    
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index]) // delete the specific expense at it's index.
                    }
                })
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) {
                AddExpenseSheet() }
            .sheet(item: $expenseToEdit, content: { expense in
                UpdateExpenseSheet(expense: expense)
            })
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                         Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see yout list.")
                    }, actions: {
                        Button("Add Expense") {
                            isShowingItemSheet = true
                        }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
