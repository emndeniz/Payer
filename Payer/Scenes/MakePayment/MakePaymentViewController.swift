//
//  MakePaymentViewController.swift
//  Payer
//
//  Created by Emin on 22.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MakePaymentViewController: UIViewController {

    @IBOutlet weak var paymentTypesTableView: UITableView!
    // MARK: - Public properties -

    var presenter: MakePaymentPresenterInterface!
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
  
        paymentTypesTableView.delegate = self
        paymentTypesTableView.dataSource = self
        
        presenter.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.tintColor = .white
    }

}

// MARK: - Extensions -

extension MakePaymentViewController: MakePaymentViewInterface {
}


extension MakePaymentViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = PaymentSections(rawValue: section) else { return 0 }
        return presenter.numberOfRowForSection(section:sectionType )
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       return presenter.paymentTypeAtIndex(index: indexPath, tableView: tableView)
    }
    
    
}