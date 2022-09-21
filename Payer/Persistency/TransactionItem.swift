//
//  TransactionItem.swift
//  Payer
//
//  Created by Emin on 21.09.2022.
//

import Foundation
import CoreData

struct TransactionItem {
    var id: UUID
    var date: Date?
    var currency: String?
    var details: String?
    var title: String?
    var from: String?
    var to: String?
    var amount: NSDecimalNumber?
    var charge: NSDecimalNumber?
    
    
    
    init(id: UUID = UUID(),
         date: Date?,
         currency: String?,
         details: String?,
         title: String?,
         from: String?,
         to: String?,
         amount: NSDecimalNumber?,
         charge: NSDecimalNumber?
    ){
        self.id = id
        self.date = date
        self.currency = currency
        self.details = details
        self.title = title
        self.from = from
        self.to = to
        self.amount = amount
        self.charge = charge
    }
    
    init(data:TransactionData){
        self.id = data.id ?? UUID()
        self.date = data.date
        self.currency = data.currency
        self.details = data.details
        self.title = data.title
        self.from = data.from
        self.to = data.to
        self.amount = data.amount
        self.charge = data.charge

    }
    
    func toData(managedObjectContext: NSManagedObjectContext) -> TransactionData {
        let transactionData = TransactionData(context:managedObjectContext)
        transactionData.id = id
        transactionData.date = date
        transactionData.currency = currency
        transactionData.details = details
        transactionData.title = title
        transactionData.from = from
        transactionData.to = to
        transactionData.amount = amount
        transactionData.charge = charge
        return transactionData
    }
    
}
