//
//  TranscationDomain.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 31/12/25.
//

import Foundation
enum TransactionType: String {
    case income
    case expense
}

struct Transaction: Identifiable {
    let id: UUID
    let title: String
    let amount: Double
    let type: TransactionType
    let date: Date
}

