//
//  FinishPaymentWireframe.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FinishPaymentWireframe: BaseWireframe<FinishPaymentViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "FinishPayment", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: FinishPaymentViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = FinishPaymentInteractor()
        let presenter = FinishPaymentPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension FinishPaymentWireframe: FinishPaymentWireframeInterface {
    func dismiss() {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
