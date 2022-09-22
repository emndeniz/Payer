//
//  SubscriptionItem.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//

import Foundation
import CoreData

struct SubscriptionItem {
    var id: UUID
    var renewalDate: Date?
    var name: String?
    var amount: NSDecimalNumber?
    
    
    init(id: UUID = UUID(),
         renewalDate: Date?,
         name: String?,
         amount: NSDecimalNumber?
    ){
        self.id = id
        self.renewalDate = renewalDate
        self.name = name
        self.amount = amount
    }
    
    init(data:SubscriptionData){
        self.id = data.id ?? UUID()
        self.renewalDate = data.renewalDate
        self.name = data.name
        self.amount = data.amount
    }
    
    func toData(managedObjectContext: NSManagedObjectContext) -> SubscriptionData {
        let subscriptionData = SubscriptionData(context:managedObjectContext)
        subscriptionData.id = id
        subscriptionData.renewalDate = renewalDate
        subscriptionData.name = name
        subscriptionData.amount = amount
        return subscriptionData
    }
    
    
}
