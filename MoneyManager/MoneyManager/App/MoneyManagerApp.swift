//
//  MoneyManagerApp.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 31/12/25.
//

import SwiftUI
import CoreData

@main
struct MoneyManagerApp: App {
    let persistence = PersistenceController.shared

     var body: some Scene {
         WindowGroup {
             let repo = TransactionRepository(
                 context: persistence.container.viewContext
             )
             let vm = DashboardViewModel(repository: repo)
             DashboardView(viewModel: vm)
         }
     }
}
