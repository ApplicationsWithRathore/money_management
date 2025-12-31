//
//  TransactionEntity+Mapping.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 31/12/25.
//

import Foundation
extension TranscationEntity {

    func toDomain() -> Transaction {
        Transaction(
            id: id ?? UUID(),
            title: title ?? "",
            amount: amount,
            type: TransactionType(rawValue: type ?? "") ?? .expense,
            date: date ?? Date()
        )
    }
}
