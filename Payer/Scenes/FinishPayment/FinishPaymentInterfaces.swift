//
//  FinishPaymentInterfaces.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol FinishPaymentWireframeInterface: WireframeInterface {
    func stopIndicator()
}

protocol FinishPaymentViewInterface: ViewInterface {
}

protocol FinishPaymentPresenterInterface: PresenterInterface {
    func getGenericTexFieldDatas() -> [GenericTextFieldData]
    func transferButtonAction(transferDatas:[GenericTextFieldData])
}

protocol FinishPaymentInteractorInterface: InteractorInterface {
    func executeTransfer(iban:String, to:String, note:String, amount:NSDecimalNumber) 
}