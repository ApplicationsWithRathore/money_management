//
//  DashboardViewModel.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 31/12/25.
//

import SwiftUI
internal import Combine

final class DashboardViewModel: ObservableObject {
    

    @Published private(set) var transactions: [Transaction] = []

    private let repository: TransactionRepositoryProtocol

    init(repository: TransactionRepositoryProtocol) {
        self.repository = repository
        load()
    }

    func load() {
        transactions = repository.fetchAll()
    }

    var totalIncome: Double {
        transactions
            .filter { $0.type == .income }
            .reduce(0) { $0 + $1.amount }
    }

    var totalExpense: Double {
        transactions
            .filter { $0.type == .expense }
            .reduce(0) { $0 + $1.amount }
    }

    var balance: Double {
        totalIncome - totalExpense
    }

    var isEmpty: Bool {
        transactions.isEmpty
    }
}
