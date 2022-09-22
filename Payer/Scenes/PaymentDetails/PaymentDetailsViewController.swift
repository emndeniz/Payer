//
//  PaymentDetailsViewController.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PaymentDetailsViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: PaymentDetailsPresenterInterface!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var detailLAbel: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var transactionFeeText: UILabel!
    @IBOutlet weak var transactionFeeLabel: UILabel!
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.tintColor = .white
        
        titleText.text = presenter.getTitle()
        detailText.text = presenter.getDetails()
        amountText.text = presenter.getAmount()
        dateText.text = presenter.getDate()
        transactionFeeText.text = presenter.getTransactionFee()
        
    }

}

// MARK: - Extensions -

extension PaymentDetailsViewController: PaymentDetailsViewInterface {
}
