//
//  PayerStore.swift
//  Payer
//
//  Created by Emin on 21.09.2022.
//

import Foundation
import CoreData

protocol PayerStoreProtocol {
    func getCardInfo(completion: @escaping ((Result<[BankCardItem], Error>) -> Void))
    func getTransactions(completion: @escaping ((Result<[TransactionItem], Error>) -> Void))
    
    func saveTransaction(transaction:TransactionItem,
                         completion: @escaping ((Result<TransactionData, Error>) -> Void))
    func saveCardInfo(card:BankCardItem,
                      completion: @escaping ((Result<BankCardData, Error>) -> Void))
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

    func getCardInfo(completion: @escaping ((Result<[BankCardItem], Error>) -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            if self.cardInfoGetAPICallCount == 10 {
                // Fail
                let err = NSError(domain: "Failed to fetch data", code: 404)
                completion(.failure(err))
            }else {
                completion(.success(self.getCardInfoItems()))
            }
        }

    }
    
    func getTransactions(completion: @escaping ((Result<[TransactionItem], Error>) -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            if self.cardInfoGetAPICallCount == 10 {
                // Fail
                let err = NSError(domain: "Failed to fetch data", code: 404)
                completion(.failure(err))
            }else {
                completion(.success(self.getTransactionsItems()))
            }
        }
    
    }
    
    func saveTransaction(transaction:TransactionItem,
                         completion: @escaping ((Result<TransactionData, Error>) -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            if self.cardInfoGetAPICallCount == 10 {
                // Fail
                let err = NSError(domain: "Failed to save data", code: 404)
                completion(.failure(err))
            }else {
                completion(.success(self.saveTransactionItems(transaction: transaction)))
            }
        }
    }
    
    func saveCardInfo(card:BankCardItem, completion: @escaping ((Result<BankCardData, Error>) -> Void)){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            if self.cardInfoGetAPICallCount == 10 {
                // Fail
                let err = NSError(domain: "Failed to save data", code: 404)
                completion(.failure(err))
            }else {
                completion(.success(self.saveCardInfoItems(card: card)))
            }
        }
    }
    
    // Those counts required for fail cases.
    private var cardInfoGetAPICallCount: Int {
        return UserDefaults.standard.integer(forKey: APICallCounts.cardInfoGetAPICallCount.rawValue)
    }
    
    private var cardInfoSaveAPICallCount: Int {
        return UserDefaults.standard.integer(forKey: APICallCounts.cardInfoSaveAPICallCount.rawValue)
    }
    
    private var transactionInfoGetAPICallCount: Int {
        return UserDefaults.standard.integer(forKey: APICallCounts.transactionInfoGetAPICallCount.rawValue)
    }
    
    private var transactionInfoSaveAPICallCount: Int {
        return UserDefaults.standard.integer(forKey: APICallCounts.transactionInfoSaveAPICallCount.rawValue)
    }
    
}

extension PayerStore {
    
    private func getCardInfoItems() -> [BankCardItem] {
        let bankCardDataItems = loadCardsCoreData()
        var bankCards: [BankCardItem] = []
        
        for item in bankCardDataItems {
            let cardInfoItem = BankCardItem(data: item)
            bankCards.append(cardInfoItem)
        }
        return bankCards
        
    }
    
    private func getTransactionsItems() -> [TransactionItem] {
        let transactionDataItems = loadTransactionsCoreData()
        var transactions: [TransactionItem] = []
        
        for item in transactionDataItems {
            let cardInfoItem = TransactionItem(data: item)
            transactions.append(cardInfoItem)
        }
        return transactions
    }
    
    private func saveTransactionItems(transaction: TransactionItem) -> TransactionData {
        let transactionData = transaction.toData(managedObjectContext: managedObjectContext)
        coreDataStack.saveContext()
        return transactionData
    }
    
    private func saveCardInfoItems(card: BankCardItem) -> BankCardData {
        let cardData = card.toData(managedObjectContext: managedObjectContext)
        coreDataStack.saveContext()
        return cardData
    }
    
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

enum APICallCounts: String {
    case cardInfoGetAPICallCount
    case cardInfoSaveAPICallCount
    case transactionInfoGetAPICallCount
    case transactionInfoSaveAPICallCount
}



