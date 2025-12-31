//
//  Repository.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 31/12/25.
//

import CoreData

protocol TransactionRepositoryProtocol {
    func fetchAll() -> [Transaction]
    func add(transaction: Transaction)
}

final class TransactionRepository: TransactionRepositoryProtocol {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }


    func fetchAll() -> [Transaction] {
        let request: NSFetchRequest<TranscationEntity> = TranscationEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]

        let result = (try? context.fetch(request)) ?? []
        return result.map { $0.toDomain() }
    }

    func add(transaction: Transaction) {
        let entity = TranscationEntity(context: context)
        entity.id = transaction.id
        entity.title = transaction.title
        entity.amount = transaction.amount
        entity.type = transaction.type.rawValue
        entity.date = transaction.date

        try? context.save()
    }
}
