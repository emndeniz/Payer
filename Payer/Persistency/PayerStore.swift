//
//  PayerStore.swift
//  Payer
//
//  Created by Emin on 21.09.2022.
//

import Foundation
import CoreData

protocol PayerStoreProtocol {
    func getCardInfo() -> [BankCardItem]
    func getTransactions() -> [TransactionItem]
    
    @discardableResult
    func saveTransaction(transaction:TransactionItem) -> TransactionData
    
    @discardableResult
    func saveCardInfo(card:BankCardItem) -> BankCardData
}

class PayerStore : PayerStoreProtocol {

    
    // MARK: - Properties
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    // MARK: - Initializers
    public init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
      self.managedObjectContext = managedObjectContext
      self.coreDataStack = coreDataStack
    }

    func getCardInfo() -> [BankCardItem] {
        let bankCardDataItems = loadCardsCoreData()
        var bankCards: [BankCardItem] = []
        
        for item in bankCardDataItems {
            let cardInfoItem = BankCardItem(data: item)
            bankCards.append(cardInfoItem)
        }
        return bankCards
        
    }
    
    func getTransactions() -> [TransactionItem] {
        let transactionDataItems = loadTransactionsCoreData()
        var transactions: [TransactionItem] = []
        
        for item in transactionDataItems {
            let cardInfoItem = TransactionItem(data: item)
            transactions.append(cardInfoItem)
        }
        return transactions
    }
    
    func saveTransaction(transaction: TransactionItem) -> TransactionData {
        let transactionData = transaction.toData(managedObjectContext: managedObjectContext)
        coreDataStack.saveContext()
        return transactionData
    }
    
    func saveCardInfo(card: BankCardItem) -> BankCardData {
        let cardData = card.toData(managedObjectContext: managedObjectContext)
        coreDataStack.saveContext()
        return cardData
    }
    
}

extension PayerStore {
    /// Loads items from Core Data
    /// - Returns: BankCard Data Array
    private func loadCardsCoreData() -> [BankCardData]{

        let request: NSFetchRequest<BankCardData> = BankCardData.fetchRequest()
        
        do {
            let items = try managedObjectContext.fetch(request)
            return items
        }  catch let error as NSError{
            Logger.log.error("Could not fetch.", context:error)
        }
        
        return []
    }
    
    /// Loads items from Core Data
    /// - Returns: BankCard Data Array
    private func loadTransactionsCoreData() -> [TransactionData]{

        let request: NSFetchRequest<TransactionData> = TransactionData.fetchRequest()
        
        do {
            let items = try managedObjectContext.fetch(request)
            return items
        }  catch let error as NSError{
            Logger.log.error("Could not fetch.", context:error)
        }
        
        return []
    }
}



