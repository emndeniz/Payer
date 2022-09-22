//
//  TransactionHistoryTable.swift
//  Payer
//
//  Created by Emin on 21.09.2022.
//

import UIKit

class TransactionHistoryTable: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var tableViewData : [TransactionItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let cellIdentifier = String(describing: TransactionsTableViewCell.self)
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: TransactionHistoryTable.self), owner: self, options: nil)
        addSubview(contentView)
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
    }
}

extension TransactionHistoryTable: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TransactionsTableViewCell
        
        return cell
    }
    
    
}
