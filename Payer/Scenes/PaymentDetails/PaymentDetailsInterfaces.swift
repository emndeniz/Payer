//
//  PaymentDetailsInterfaces.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol PaymentDetailsWireframeInterface: WireframeInterface {
}

protocol PaymentDetailsViewInterface: ViewInterface {
}

protocol PaymentDetailsPresenterInterface: PresenterInterface {
    func getTitle() -> String
    func getDetails() -> String
    func getDate() -> String
    func getTransactionFee() -> String
    func getAmount() ->String
}

protocol PaymentDetailsInteractorInterface: InteractorInterface {
}
