//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Andreas Antonsson on 2023-11-21.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    
    // 2 ways of injecting the Swift Data container in the app. 
    
    // Way for configuring the container.
   let container: ModelContainer = {
        let schema = Schema([Expense.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
        //.modelContainer(for: [Expense.self])
        
    }
}
