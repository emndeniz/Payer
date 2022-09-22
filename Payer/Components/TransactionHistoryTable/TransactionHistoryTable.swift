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
    
    var presenter: PresenterInterface?
    
    private let cellIdentifier = String(describing: TransactionsTableViewCell.self)
    private let emptyCellIdentifier = String(describing: EmptyTableViewCell.self)
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
        tableView.register(UINib.init(nibName: emptyCellIdentifier, bundle: nil), forCellReuseIdentifier: emptyCellIdentifier)
        
    }
}

extension TransactionHistoryTable: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 || section == 2 {
            return 1
        }else {
            return tableViewData.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 || indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: emptyCellIdentifier) as! EmptyTableViewCell
            
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TransactionsTableViewCell
            
            cell.setData(item: tableViewData[indexPath.row])
            
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter as? PaymentsHomePresenter else { return }
        
        presenter.didSelectRow(index: indexPath)
    }

    
    
}
