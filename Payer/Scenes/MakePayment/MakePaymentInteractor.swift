//
//  MakePaymentInteractor.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MakePaymentInteractor {
    private let coreDataStack: CoreDataStack = CoreDataStack()
    private var payerStore: PayerStoreProtocol
    
    init (payerStore: PayerStoreProtocol? = nil){
        // Allows injection
        if let payerStore = payerStore {
            self.payerStore = payerStore
        }else {
            self.payerStore =  PayerStore(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
        }
       
    }
}

// MARK: - Extensions -

extension MakePaymentInteractor: MakePaymentInteractorInterface {
    
    func getAvailableTransactionTypes() -> [AvailableTransactionTypes] {
        return AvailableTransactionTypes.allCases
    }
    
    func getSubscriptions(completion: @escaping ((Result<[SubscriptionItem], Error>) -> Void)) {
        
        payerStore.getSubscriptions { result in
            completion(result)
        }
    }
    
}

// In case new transaction required, we need to add new case to this enum.
enum AvailableTransactionTypes:Int,CaseIterable {
//    case transfer = "Money Transfer"
    case apple
    case amazon
    case netflix
    case spotify
    
    var amount: NSDecimalNumber {
        switch self{
        case .apple:
            return 5
        case .amazon:
            return 3.99
        case .netflix:
            return 10.50
        case .spotify:
            return 2.99
        }
    }
    
    var description : String {
        switch self {
        case .apple:
            return "payment_Apple"
        case .amazon:
            return "payment_Amzon"
        case .netflix:
            return "payment_Netflix"
        case .spotify:
            return "payment_Spotify"
        }
    }
}
