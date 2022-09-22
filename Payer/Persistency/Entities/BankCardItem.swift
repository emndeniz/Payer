//
//  BankCardItem.swift
//  Payer
//
//  Created by Emin on 21.09.2022.
//

import Foundation
import CoreData

struct BankCardItem {
    var userName: String?
    var cardNumber: String?
    var expirationDate: Date?
    var vendor: String?
    var balance: NSDecimalNumber?
    var ccv: Int?
    
    init(userName: String?,
         cardNumber: String?,
         expirationDate: Date?,
         vendor: String?,
         balance: NSDecimalNumber?,
         ccv: Int?){
        self.userName = userName
        self.cardNumber = cardNumber
        self.expirationDate = expirationDate
        self.vendor = vendor
        self.balance = balance
        self.ccv = ccv
    }
    
    init(data:BankCardData){
        self.userName = data.userName
        self.cardNumber = data.cardNumber
        self.expirationDate = data.expirationDate
        self.vendor = data.vendor
        self.balance = data.balance
        self.ccv = Int(data.ccv)
    }
    
    
    func toData(managedObjectContext: NSManagedObjectContext) -> BankCardData {
        let bankCardData = BankCardData(context:managedObjectContext)
        bankCardData.userName = userName
        bankCardData.cardNumber = cardNumber
        bankCardData.expirationDate = expirationDate
        bankCardData.vendor = vendor
        bankCardData.balance = balance
        bankCardData.ccv = Int16(ccv ?? 0)
        return bankCardData
    }
}
